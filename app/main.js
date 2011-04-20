require({
    paths: {
      cs: '../vendor/rjs-cs',
      text: '../vendor/rjs-text-min',
      vendor: '../vendor',
      spec: '../spec',
      backbone: '../vendor/backbone-min',
      jquery: '../vendor/jquery-1.5.1.min',
      sinon: '../vendor/sinon-1.0.0'
    },
    priority: ['jquery', 'vendor/underscore-min', 'cs!lib/namespace', 'backbone']
  },
  [
    'jquery',
    'cs!config',
    'cs!controllers/app_controller',
    'cs!controllers/session',
    'cs!controllers/friends',
    'cs!models/user', 
    'backbone',
    'vendor/underscore-min',
    'cs!lib/namespace'
  ], function($, AppConfig) {
    function ignite_with(fire) {
      if (App.Config.current_device == 'mobile') {
        $(document).bind('deviceready', function() { fire() });
      }
      else {
        $(function() { fire() });
      }
    };

    App.Config = new AppConfig({env: 'test'});

    if (App.Config.env == 'test') {
      var specs = [
        'cs!spec/integration/startup_spec'
      ];
      require({
          priority: ['vendor/jasmine-1.0.2/jasmine', 'vendor/jasmine-1.0.2/jasmine-html']
        },
        ['text!vendor/jasmine-1.0.2/jasmine.css', 'vendor/jasmine-1.0.2/jasmine', 'vendor/jasmine-1.0.2/jasmine-html', 'sinon'].concat(specs), function(css) {
          $('<style type="text/css">').text(css).appendTo('head');

          ignite_with(function() {
              jasmine.getEnv().addReporter(new jasmine.TrivialReporter());
              jasmine.getEnv().execute();
          });
      })
    }
    else {
      ignite_with(function() {
          var app = new App.Controller.Main;
          new App.Controller.Session;
          new App.Controller.Friends;
          Backbone.history.start();

          app.start();
      });
    }
  }
);
