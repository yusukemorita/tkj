// Generated by CoffeeScript 1.11.1
(function() {
  var app;

  $(document).ready(function() {
    app.initialize();
    return console.log('top.coffee called');
  });

  app = {
    initialize: function() {
      var available_height, circle_margin, parent_margin;
      available_height = $(window).height() - $('.navbar').outerHeight(true) - $('.footer').outerHeight(true);
      if ($(window).width() > 600) {
        parent_margin = (available_height - $('.child').outerHeight(true)) * 0.5;
        circle_margin = (available_height - $('.parent_circle').outerHeight(true)) * 0.5;
        $('.parent').css({
          marginTop: parent_margin,
          marginBottom: parent_margin
        });
        return $('.parent_circle').css({
          marginTop: circle_margin,
          marginBottom: circle_margin
        });
      }
    }
  };

}).call(this);
