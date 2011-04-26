require({
    paths: {
      cs: '../vendor/rjs-cs',
      text: '../vendor/rjs-text-min',
      vendor: '../vendor',
      spec: '../spec',
      backbone: '../vendor/backbone',
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
    'cs!controllers/posts',
    'cs!models/user', 
    'backbone',
    'vendor/underscore-min',
    'cs!lib/namespace'
  ], function($, JogConfig) {
    function ignite_with(fire) {
      if (Jog.config.current_device == 'mobile') {
        $(document).bind('deviceready', function() { fire() });
      }
      else {
        $(function() { fire() });
      }
    };

    Jog.start = function() {
      Jog.Controller.main = new Jog.Controller.Main;
      Jog.Controller.session = new Jog.Controller.Session;
      Jog.Controller.posts = new Jog.Controller.Posts;
      Jog.Controller.friends = new Jog.Controller.Friends;

      Backbone.history.start();
      Jog.Controller.main.start();
    };

    Jog.config = new JogConfig({env: 'test'});

    if (Jog.config.env == 'test') {
      var specs = [
        'cs!spec/helpers',
        'cs!spec/integration/startup_spec'
      ];
      require({
          priority: ['vendor/jasmine-1.0.2/jasmine', 'vendor/jasmine-1.0.2/jasmine-html', 'sinon']
        },
        ['text!vendor/jasmine-1.0.2/jasmine.css', 'vendor/jasmine-1.0.2/jasmine', 'vendor/jasmine-1.0.2/jasmine-html', 'sinon', 'vendor/jasmine-sinon'].concat(specs), function(css) {
          $('<style type="text/css">').text(css).appendTo('head');

          ignite_with(function() {
              jasmine.getEnv().addReporter(new jasmine.TrivialReporter());
              jasmine.getEnv().execute();
          });
      })
    }
    else {
      ignite_with(function() {
          Jog.start();
      });
    }
  }
);
