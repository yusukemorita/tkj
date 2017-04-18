$(document).ready ->
  app.initialize()
  console.log 'public new.coffee called'

app =
  initialize: ->
    if $(window).width() > 600
      available_height = $(window).outerHeight(true) - $('.nav_bar').outerHeight() - $('.footer').height()
      $('.new_map').css
        marginTop: available_height * 0.1
        marginBottom: available_height * 0.1
        width: $('.yield_container').width() - $('.new_form').outerWidth(true)
        height: $('.new_form').height()
        #height: ( $(window).height() - $('.footer').outerHeight(true) - $('.blank_div').outerHeight(true) ) * 0.8
      #console.log "yield_container width = #{$('.yield_container').width()}, form width =  #{$('.new_form').outerWidth(true)}"
    else
      $('.new_map').css
        height: ( $(window).height() - $('.new_form').offset().top - $('.new_form').outerHeight(true) ) * 0.9
