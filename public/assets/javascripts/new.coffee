$(document).ready ->
  console.log 'public new.coffee called'
  app.initialize()

app =
  initialize: ->
    $('.step1_popover').popover('show')

    #クリックされたらpopoverを消す
    $('.popover').click ->
      $('.step1_popover').popover('hide')

    #デスクトップ表示
    if $(window).width() > 600
      available_height = $(window).outerHeight(true) - $('.nav_bar').outerHeight() - $('.footer').height()

      #ポップアップ
      $('.popover').css
        top: available_height * 0.5
        left: available_height * 0.3

      #マップ
      $('.new_map').css
        marginTop: available_height * 0.1
        marginBottom: available_height * 0.1
        height: available_height * 0.8

      $('.new_place').css
        marginTop: available_height * 0.1

    #モバイル表示
    else

      #マップ
      $('.new_map').css
        height: $(window).height() * 0.6

      #ポップアップ
      $('.popover').css
        top: $(window).height() * 0.3
        left: ( $(window).width() - $('.popover').width() ) / 2 - 10
