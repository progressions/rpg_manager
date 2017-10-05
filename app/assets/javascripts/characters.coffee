# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on "click", "[data-behavior~=health]", (event) ->
    $(event.target.dataset.connected).toggle()
    field = $(event.target.dataset.connected).find("input[type=text]")
    field.focus()

    value = field.val() + "-"

    field.val(value)

  $(document).on "click", "[data-behavior~=calculator] input[type=submit]", (event) ->
    field = $(event.target).prev("input[type=text]")

    reg = new RegExp(/^[\d\(\)\-+]+$/)
    if reg.test(field.val())
      field.val eval(field.val())
    else
      field.val field.data("original")
