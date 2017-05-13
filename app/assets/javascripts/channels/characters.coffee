App.characters = App.cable.subscriptions.create "CharactersChannel",
  connected: ->
    $("#connection").html("On").removeClass("off").addClass("on")

  disconnected: ->
    $("#connection").html("Off").removeClass("on").addClass("off")

  received: (data) ->
    if data['action'] is 'change'
      $("#character_#{data['id']}").replaceWith(data['data'])
    else if data['action'] is 'create'
      alert "create"

  change: (data) ->
    @perform 'create', data: data

  create: (data) ->
    @perform 'create', data: data
