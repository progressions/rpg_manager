App.characters = App.cable.subscriptions.create "CharactersChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#character_#{data['id']}").replaceWith(data['data'])

  change: (data) ->
    @perform 'change', data: data
