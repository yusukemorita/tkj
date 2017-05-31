$(document).ready ->
  app.initialize()
  console.log 'public map.coffee called'

app =
  initialize: ->
    $('.footer_blank_div').css
      display: 'none'
    available_height = $(window).height() - $('.navbar').height() - $('.footer').height()
    if $(window).width() > 600
      $('.map_map').css
        height: available_height * 0.8
        marginTop: available_height * 0.1
        marginBottom: available_height * 0.1
      $('.parent').css
        marginTop: available_height * 0.1
        marginBottom: available_height * 0.1
        height: available_height * 0.8
        marginRight:0
