command: "pmset -g batt | awk 'FNR == 2 {print $2}' | sed -e 's/;//g'"

refreshFrequency: '5s'

style: """
  top: 196px
  left: 16px
"""

render: -> """
<div class="container">
  <div class='label'><i class='ic ic-bolt'></i><span class='percent'></span></div>
  <progress max='100' value='74' class='progress-bar'></progress>
</div>
"""

update: (output, domEl) ->
  percent = parseInt(output)

  $(domEl).find('.percent').text output
  $(domEl).find('.progress-bar').attr "value", percent