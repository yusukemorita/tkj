(function() {
  var app;

  $(document).on('turbolinks:load', function() {
    return app.initialize();
  });

  app = {
    initialize: function() {
      return console.log('places.coffee called');
    }
  };

}).call(this);
