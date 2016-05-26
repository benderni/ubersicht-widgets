command:"""
date +\"%H:%M \\ %A:%e:%b\"
"""

refreshFrequency: '10s'

style: """
top: 0px
left: 16px

.container
  font-size: 96px
  width: 100%

.container .time .hour,
.container .date .day
  color: rgba(250, 238, 223, .65)

.container .date
  font-size: 32px
"""

render: -> """
<div class='container'>
  <div class='time'><span class='hour'></span><span class='minute'></span></div>
  <div class='date'>
    <span class='day'></span>
    <span class='day-int'></span>
    <span class='month'></span>
  </div>
</div>
"""

update: (output, domEl) ->
  output = output.split('\\')

  time = output[0].split(':')
  date = output[1].split(':')

  $(domEl).find('.time .hour').text time[0]
  $(domEl).find('.time .minute').text time[1]
  $(domEl).find('.date .day').text date[0]
  $(domEl).find('.date .day-int').text date[1]
  $(domEl).find('.date .month').text date[2]