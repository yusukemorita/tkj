$(document).ready ->
  app.initialize()
  console.log 'universal.coffee called'

app =
  initialize: ->
    $('.menu_icon').click ->
      console.log 'clicked'
      $('#dropdown').toggle()
    $('.yield_container').css
      marginTop: $('.nav_bar').height() + 10
