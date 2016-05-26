
command: """top -u -l 1 | grep 'CPU usage' | awk '{print $7}'"""

refreshFrequency: '10s'

style: """
  top: 284px
  left: 16px
"""

render: -> """
<div class="container">
  <div class='label'><i class='ic ic-cpu'></i><span class='percent'></span></div>
  <progress max='100' value='74' class='progress-bar'></progress>
</div>
"""

update: (output, domEl) ->
  percent = parseInt(output)

  $(domEl).find('.percent').text percent + '%'
  $(domEl).find('.progress-bar').attr "value", percent