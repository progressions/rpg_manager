App.characters = App.cable.subscriptions.create "CharactersChannel",
  connected: ->
    $("#connection").html("On").removeClass("off").addClass("on")

  disconnected: ->
    $("#connection").html("Off").removeClass("on").addClass("off")


  received: (data) ->
    $("#character_#{data['id']}").replaceWith(data['data'])

  change: (data) ->
    @perform 'change', data: data
