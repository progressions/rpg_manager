$ ->
  encounter_id = $("#encounter_id").val()

  App.characters = App.cable.subscriptions.create { channel: "CharactersChannel", encounter_id: encounter_id },
    connected: ->
      $("#connection").html("On").removeClass("off").addClass("on")

    disconnected: ->
      $("#connection").html("Off").removeClass("on").addClass("off")

    received: (data) ->
      $("#log").append("<p>Message: #{data['action']}</p>")
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
