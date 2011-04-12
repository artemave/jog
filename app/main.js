require({
    paths: { // RequireJS plugin aliases
      cs: '../vendor/rjs-cs',
      text: '../vendor/rjs-text-min',
      vendor: '../vendor',
      spec: '../spec'
    },
    priority: ['vendor/jquery-1.5.1.min', 'vendor/underscore-min', 'vendor/webtoolkit.base64']
  },
  ['cs!views/app', 'cs!config', 'vendor/jquery-1.5.1.min', 'vendor/backbone-min', 'vendor/underscore-min', 'vendor/webtoolkit.base64'], function(AppView, AppConfig) {
    function ignite_with(fire) {
      if (window.AppConfig.current_device == 'mobile') {
        $(document).bind('deviceready', function() { fire() });
      }
      else {
        $(function() { fire() });
      }
    };

    window.AppConfig = new AppConfig({env: 'test'});

    if (window.AppConfig.env == 'test') {
      var specs = [
        'cs!spec/integration/startup_spec'
      ];
      require({
          priority: ['vendor/jasmine-1.0.2/jasmine', 'vendor/jasmine-1.0.2/jasmine-html']
        },
        ['text!vendor/jasmine-1.0.2/jasmine.css', 'vendor/jasmine-1.0.2/jasmine', 'vendor/jasmine-1.0.2/jasmine-html', 'vendor/sinon-1.0.0'].concat(specs), function(css) {
          $('<style type="text/css">').text(css).appendTo('head');

          ignite_with(function() {
              jasmine.getEnv().addReporter(new jasmine.TrivialReporter());
              jasmine.getEnv().execute();
          });
      })
    }
    else {
      ignite_with(function() {
          window.App = new AppView;
          //Backbone.history.start();
      });
    }
  }
);
