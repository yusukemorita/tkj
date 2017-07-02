$(document).ready ->
  app.initialize()
  console.log 'universal.coffee called'

app =
  initialize: ->
    $('.menu_icon').click ->
      $('#dropdown').toggle()
    $('.yield_container').css
      marginTop: $('.navbar').height()
