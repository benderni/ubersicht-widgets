
command: """memory_pressure"""

refreshFrequency: '10s'

style: """
  top: 240px
  left: 16px
"""

render: -> """
<div class="container">
  <div class='label'><i class='ic ic-ram'></i><span class='percent'></span></div>
  <progress max='100' value='74' class='progress-bar'></progress>
</div>
"""

update: (output, domEl) ->
  lines = output.split "\n"

  percentage = lines[27].split(': ')[1]

  $(domEl).find('.percent').text percentage
  $(domEl).find('.progress-bar').attr "value", parseInt(percentage)