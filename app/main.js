var ENV = 'test';

require({
    paths: {
      cs: '../vendor/rjs-cs',
      text: '../vendor/rjs-text-min',
      order: '../vendor/rjs-order-min',
      vendor: '../vendor',
      spec: '../spec'
    }
  },
  [
    'order!vendor/jquery-1.5.1.min',
    'order!vendor/underscore-min',
    'order!vendor/backbone',
    'order!cs!lib/namespace',
    'order!cs!config',
    'order!cs!controllers/app_controller',
    'order!cs!controllers/session',
    'order!cs!controllers/friends',
    'order!cs!controllers/posts',
    'order!cs!models/user'
  ], function() {
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

      try {
        Backbone.history.start();
      }
      catch (e) {
        if (e.message != 'Backbone.history has already been started') {
          throw e;
        }
      }
      Jog.Controller.main.start();
    };

    Jog.config = new Jog.Config({env: ENV});

    if (Jog.config.env == 'test') {
      var specs = [
        'order!cs!spec/helpers',
        'order!cs!spec/integration/startup_spec',
        'order!cs!spec/models/user_spec'
      ];
      require(
        [
          'text!vendor/jasmine-1.0.2/jasmine.css',
          'order!vendor/jasmine-1.0.2/jasmine',
          'order!vendor/jasmine-1.0.2/jasmine-html',
          'order!vendor/sinon-1.0.0'
        ].concat(specs), function(css) {
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
