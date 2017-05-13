App.message = App.cable.subscriptions.create "MessageChannel",
  connected: ->
    $("#connection").html("On").removeClass("off").addClass("on")

  disconnected: ->
    $("#connection").html("Off").removeClass("on").addClass("off")

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    @perform 'speak', data: message
