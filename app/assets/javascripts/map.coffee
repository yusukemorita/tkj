$(document).on 'turbolinks:load', ->
  app.initialize()

app =
  initialize: ->
    navbar_height = $('.blank_div').height()
    footer_height = $('.footer').height()
    available_window_height = $(window).height() - navbar_height - footer_height
    window_width = $('.yield_container').width()
    map_height = available_window_height * 0.8
    map_width = window_width * 0.6
    console.log "map_width=#{map_width}, map_height=#{map_height}"
    def_margin = available_window_height * 0.1
    $('#map').css
      width: map_width
      height: map_height
      margin: def_margin
    $('.parent').css
      width: window_width - available_window_height * 0.2 - map_width
      height: map_height
      marginTop: def_margin
      marginRight:0
      marginBottom: def_margin
