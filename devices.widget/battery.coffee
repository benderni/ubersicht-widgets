command: """
system_profiler SPBluetoothDataType | grep -E "Battery|Services" | sed "s/Services://g" | sed "s/Battery Level://g" | sed "s/Apple Wireless//g" | sed -e 's/^[ \t]*//' | paste -d" " - -
"""

refreshFrequency: '30s'

style: """
  top: 328px
  left: 16px
"""

renderInfo: (name, pctg) -> """
  <div class="container">
    <div class='label'><i class='ic ic-mouse'></i><span class='percent'>#{pctg}%</span></div>
    <progress max='100' value='#{pctg}' class='progress-bar'></progress>
  </div>
"""

update: (output, domEl) ->
  devices = output.split('\n')
  patt = /(.*?)(\d{1,3}%)/

  $(domEl).html ''
  render = @renderInfo

  for device, i in devices when device.match patt
    do (device) ->
      [match, name, pct] = device.match patt
      $(domEl).append render(name, parseInt(pct))
