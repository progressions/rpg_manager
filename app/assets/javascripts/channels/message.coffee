App.message = App.cable.subscriptions.create "MessageChannel",
  connected: ->
    $("#connection").html("On").removeClass("off").addClass("on")

  disconnected: ->
    $("#connection").html("Off").removeClass("on").addClass("off")

  received: (data) ->
    $("#messages").prepend(data['data'])

  speak: (message) ->
    @perform 'speak', data: message

$(document).on "keypress", "[data-behavior~=message_speaker]", (event) ->
  if event.keyCode is 13
    App.message.speak event.target.value
    event.target.value = ''
    event.preventDefault()
