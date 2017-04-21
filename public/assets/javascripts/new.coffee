$(document).ready ->
  console.log 'public new.coffee called'
  app.initialize()

app =
  initialize: ->
    $('.tip_popover').popover('show')
    $('.popover').click ->
      $('.tip_popover').popover('hide')

    if $(window).width() > 600
      $('.popover').css
        top: $('#place_address').offset().top
        left: $('#place_address').offset().left + $('#place_address').width()
      available_height = $(window).outerHeight(true) - $('.nav_bar').outerHeight() - $('.footer').height()
      $('.new_map').css
        marginTop: available_height * 0.1
        marginBottom: available_height * 0.1
        width: $('.yield_container').width() - $('.new_form').outerWidth(true)
        height: $('.new_form').height()
        #height: ( $(window).height() - $('.footer').outerHeight(true) - $('.blank_div').outerHeight(true) ) * 0.8
      #console.log "yield_container width = #{$('.yield_container').width()}, form width =  #{$('.new_form').outerWidth(true)}"
    else
      $('.new_form input').css
        width: $('.yield_container').width() * 0.43
      $('.popover').css
        top: '60%'
        left: 0.5 * ($('.yield_container').width()- $('.popover').width() )
      $('.new_map').css
        height: ( $(window).height() - $('.new_form').offset().top - $('.new_form').outerHeight(true) ) * 0.9
