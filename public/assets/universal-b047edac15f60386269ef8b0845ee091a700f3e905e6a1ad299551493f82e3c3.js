(function() {
  var app;

  $(document).ready(function() {
    app.initialize();
    return console.log('universal.coffee called');
  });

  app = {
    initialize: function() {
      return $('.menu_icon').click(function() {
        console.log('clicked');
        return $('#dropdown').toggle();
      });
    }
  };

}).call(this);
