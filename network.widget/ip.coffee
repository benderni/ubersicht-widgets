command:"""
ifconfig en0 | grep -E "(inet |status:)" | head -n 1 | awk '{print $2}' && curl -s http://ipecho.net/plain
"""

refreshFrequency: '60s'

style: """
.container
  font-size: 14px
  padding: 2px 0 0 340px

  i
    padding: 0 6px 0 0
"""

render: -> """
<div class='container'>
  <div class="local"><i class='ic ic-wifi'></i><span class='ip'></span></div>
  <div class="public"><i class='ic ic-globe'></i><span class='ip'></span></div>
</div>
"""

update: (output, domEl) ->
  output = output.split('\n');
  $(domEl).find('.local .ip').text output[0]
  $(domEl).find('.public .ip').text output[1]
