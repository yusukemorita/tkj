$(document).on 'turbolinks:load', ->
  app.initialize()
  console.log 'map.coffee called'

app =
  initialize: ->
    navbar_height = $('.blank_div').height()
    footer_height = $('.footer').height()
    available_window_height = $(window).height() - navbar_height - footer_height
    window_width = $('.yield_container').width()
    map_width = window_width * 0.6
    def_margin = available_window_height * 0.1
    if $(window).width() > 600
      $('.map_map').css
        height: available_window_height * 0.8
      console.log available_window_height * 0.8
      $('.parent').css
        height: available_window_height * 0.8
        marginRight:0
    else
      $('.map_map').css
        height: $(window).height() -  $('.parent').offset().top - $('.parent').outerHeight(true)
