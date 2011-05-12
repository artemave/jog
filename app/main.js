var ENV = 'test';
var dep_libs = [
  'vendor/jquery-1.5.1.min',
  'vendor/underscore-min',
  'vendor/backbone',
  'cs!lib/namespace'
];
var app_libs = [
  'cs!config',
  'cs!controllers/app_controller',
  'cs!controllers/session',
  'cs!controllers/friends',
  'cs!controllers/posts',
  'cs!models/user'
];

require({
    paths: {
      cs: '../vendor/rjs-cs',
      text: '../vendor/rjs-text-min',
      order: '../vendor/rjs-order-min',
      vendor: '../vendor',
      spec: '../spec'
    }
  }, dep_libs, function() {
      require(app_libs, function() {
          function ignite_with(fire) {
            if (Jog.config.current_device == 'mobile' && navigator.device == undefined) { //navigator.device == undefined is a hack against deviceready being fired too early to catch (android)
              $(document).bind('deviceready', function() {
                  $(function() { fire() });
              });
            }
            else {
              $(function() { fire() });
            }
          };

          Jog.start = function() {
            var app = {
              controllers: {
                main: new Jog.Controller.Main,
                session: new Jog.Controller.Session,
                posts: new Jog.Controller.Posts,
                friends: new Jog.Controller.Friends
              }
            };

            try {
              Backbone.history.start();
            }
            catch (e) {
              if (e.message != 'Backbone.history has already been started') {
                throw e;
              }
            }
            app.controllers.main.start();

            return app;
          };

          Jog.config = new Jog.Config({env: ENV});

          if (Jog.config.env == 'test') {
            var specs = [
              'cs!spec/helpers',
              'cs!spec/integration/startup_spec',
              'cs!spec/models/user_spec'
            ];
            var spec_deps = [
              'text!vendor/jasmine-1.0.2/jasmine.css',
              'order!vendor/jasmine-1.0.2/jasmine',
              'order!vendor/jasmine-1.0.2/jasmine-html',
              'vendor/sinon-1.0.0'
            ];
            require(spec_deps, function(css) {
                require(specs, function() {
                    $('<style type="text/css">').text(css).appendTo('head');

                    ignite_with(function() {
                        jasmine.getEnv().addReporter(new jasmine.TrivialReporter());
                        jasmine.getEnv().execute();
                    });
                });
            });
          }
          else {
            ignite_with(function() {
                Jog.start();
            });
          }
      });
});
