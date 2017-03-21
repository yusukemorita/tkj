$(document).on 'turbolinks:load', ->
  app.initialize()

app =
  initialize: ->
    navbar_height = $('.nav_bar').height()
    available_window_height = $(window).height() - navbar_height
    window_width = $(window).width()
    map_height = available_window_height * 0.8
    map_width = window_width * 0.8
    console.log "map_width=#{map_width}, map_height=#{map_height}"
    $('#map').css
      width: map_width
      height: map_height
      top: navbar_height + available_window_height * 0.1
    #TODO not working
    $('.nav_list').width(available_window_width / 3)
