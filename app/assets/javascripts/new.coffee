$(document).ready ->
  app.initialize()
  console.log 'new.coffee called'

app =
  initialize: ->
    if $(window).width() > 600
      $('.new_map').css
        width: $('.yield_container').width() - $('.new_form').outerWidth(true)
        height: ( $(window).height() - $('.footer').outerHeight(true) - $('.blank_div').outerHeight(true) ) * 0.8
      console.log "yield_container width = #{$('.yield_container').width()}, form width =  #{$('.new_form').outerWidth(true)}"
      console.log 'new.coffee called'
    else
      $('.new_map').css
        height: ( $(window).height() - $('.new_form').offset().top - $('.new_form').outerHeight(true) ) * 0.9
