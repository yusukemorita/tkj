$(document).ready ->
  app.initialize()
  console.log 'universal.coffee called'

app =
  initialize: ->
    $('.menu_icon').click ->
      console.log 'clicked'
      $('#dropdown').toggle()
