$ ->
  encounter_id = $("#encounter_id").val()

  App.message = App.cable.subscriptions.create { channel: "MessageChannel", encounter_id: encounter_id },
    connected: ->
      $("#connection").html("On").removeClass("off").addClass("on")

    disconnected: ->
      $("#connection").html("Off").removeClass("on").addClass("off")

    received: (data) ->
      $("#messages").prepend(data['data'])

    speak: (data) ->
      @perform 'speak', encounter_id: data['encounter_id'], body: data['body']

  $(document).on "keypress", "[data-behavior~=message_speaker]", (event) ->
    if event.keyCode is 13
      App.message.speak { encounter_id: $("#encounter_id").val(), body: event.target.value }
      event.target.value = ''
      event.preventDefault()