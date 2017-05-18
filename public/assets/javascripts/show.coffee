$(document).ready ->
  app.initialize()
  console.log 'public show.coffee called'

app =
  initialize: ->
    available_height = $(window).height() - $('.nav_bar').height() - $('.footer').height()
    if $(window).width() > 600
      $('.show_map').css
        height: available_height * 0.8
        marginTop: available_height * 0.1
        marginBottom: available_height * 0.1
      $('.show_text').css
        marginTop: available_height * 0.1
        marginBottom: available_height * 0.1
        marginRight:0
    else
      $('.map_map').css
        height: $(window).height() -  $('.parent').offset().top - $('.parent').outerHeight(true)
