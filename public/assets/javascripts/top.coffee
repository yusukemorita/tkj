$(document).ready ->
  app.initialize()
  console.log 'top.coffee called'

app =
  initialize: ->
    available_height = $(window).height() - $('.navbar').outerHeight(true) - $('.footer').outerHeight(true)
    console.log "available_height = #{available_height}"
    if $(window).width() > 600
      parent_margin = ( available_height - $('.child').outerHeight(true) ) * 0.5
      console.log "child height = #{$('.child').outerHeight(true)}"
      circle_margin  = ( available_height - $('.parent_circle').outerHeight(true) ) * 0.5
      console.log "circle height = #{$('.parent_circle').outerHeight(true)}"
      console.log "parent margin = #{parent_margin}"
      console.log "circle margin = #{circle_margin}"
      $('.parent').css
        marginTop: parent_margin
        marginBottom: parent_margin
      $('.parent_circle').css
        marginTop: circle_margin
        marginBottom: circle_margin

