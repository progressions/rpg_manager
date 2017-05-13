App.characters = App.cable.subscriptions.create "CharactersChannel",
  connected: ->
    $("#connection").html("On").removeClass("off").addClass("on")

  disconnected: ->
    $("#connection").html("Off").removeClass("on").addClass("off")

  received: (data) ->
    $("body").append("<p>Message: #{data['action']}</p>")
    if data['action'] is 'change'
      $("#character_#{data['id']}").replaceWith(data['data'])
    else if data['action'] is 'create'
      $("#list").append(data['data'])
    else if data['action'] is 'destroy'
      $("#character_#{data['id']}").remove()

  change: (data) ->
    @perform 'change', data: data

  create: (data) ->
    @perform 'create', data: data

  destroy: (data) ->
    @perform 'destroy', data: data
