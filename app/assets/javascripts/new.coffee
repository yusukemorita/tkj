$(document).on 'turbolinks:load', ->
  app.initialize()

app =
  initialize: ->
    if $(window).width() > 600
      $('#map').css
        width: $('.yield_container').width() - $('.new_form').outerWidth(true)
        height: ( $(window).height() - $('.footer').outerHeight(true) - $('.blank_div').outerHeight(true) ) * 0.8
      console.log $('.yield_container').width() - $('.new_form').outerWidth(true)

