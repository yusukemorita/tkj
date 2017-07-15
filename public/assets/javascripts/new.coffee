$(document).ready ->
  console.log 'changed new.coffee called'
  app.initialize()

app =
  initialize: ->
    $('.step1_popover').popover('show')

    #クリックされたらpopoverを消す
    $('.popover').click ->
      $('.step1_popover').popover('hide')

    #デスクトップ表示
    if $(window).width() > 600
      available_height = $(window).outerHeight(true) - $('.navbar').outerHeight() - $('.footer').height()

      #ポップアップのcss
      $('.popover').css
        top: available_height * 0.5
        left: available_height * 0.3

      $('.new_place').css
        marginTop: available_height * 0.1

    #モバイル表示
    else

      #ポップアップ
      $('.popover').css
        top: $(window).height() * 0.3
        left: ( $(window).width() - $('.popover').width() ) / 2 - 10
