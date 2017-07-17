$(document).ready ->
  console.log 'new.coffee called'
  app.initialize()

app =
  initialize: ->

    $('#newModal').modal({
      keyboard: true
    })
    $('#newModal').modal('show')
    #デスクトップ表示
    if $(window).width() > 600
      available_height = $(window).outerHeight(true) - $('.navbar').outerHeight() - $('.footer').height()

      $('.new_place').css
        marginTop: available_height * 0.1
