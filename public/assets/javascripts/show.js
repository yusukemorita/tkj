// Generated by CoffeeScript 1.11.1
(function() {
  var app;

  $(document).ready(function() {
    app.initialize();
    return console.log('public show.coffee called');
  });

  app = {
    initialize: function() {
      var available_height;
      available_height = $(window).height() - $('.nav_bar').height() - $('.footer').height();
      if ($(window).width() > 600) {
        $('.show_map').css({
          height: available_height * 0.8,
          marginTop: available_height * 0.1,
          marginBottom: available_height * 0.1
        });
        return $('.show_text').css({
          marginTop: available_height * 0.1,
          marginBottom: available_height * 0.1,
          marginRight: 0
        });
      } else {
        return $('.show_map').css({
          height: $(window).height() - $('.show_text').offset().top - $('.show_text').outerHeight(true) - 30,
          marginTop: 15,
          marginBottom: 15
        });
        return $('.url_div').css({
          width: $('.show_map').width()
        });
      }
    }
  };

}).call(this);
