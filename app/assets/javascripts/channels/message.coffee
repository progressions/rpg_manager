$(document).ready ->
  encounter_id = $("body").data("current-encounter-id")
  user_id = $("body").data("current-user-id")

  if encounter_id
    App.message = App.cable.subscriptions.create { channel: "MessageChannel", encounter_id: encounter_id },
      connected: ->
        $("#connection").html("On").removeClass("off").addClass("on")

      disconnected: ->
        $("#connection").html("Off").removeClass("on").addClass("off")

      received: (data) ->
        $("#messages").prepend(data['data'])

      speak: (data) ->
        @perform 'speak', user_id: user_id, encounter_id: data['encounter_id'], body: data['body']

    $(document).on "keypress", "[data-behavior~=message_speaker]", (event) ->
      if event.keyCode is 13 and event.target.value
        App.message.speak { user_id: user_id, encounter_id: encounter_id, body: event.target.value }
        event.target.value = ''
        event.preventDefault()
