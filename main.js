require({
    paths: { // RequireJS plugin aliases
      cs: 'vendor/rjs-cs',
      text: 'vendor/rjs-text-min'
    },
    priority: ['vendor/jquery-1.5.1.min', 'vendor/underscore-min', 'vendor/webtoolkit.base64']
  },
  ['cs!views/app', 'cs!lib/config', 'vendor/jquery-1.5.1.min', 'vendor/backbone-min', 'vendor/underscore-min', 'vendor/webtoolkit.base64'], function(AppView, AppConfig) {
    function ignite() {
      window.App = new AppView;
    };

    window.AppConfig = new AppConfig;

    if (window.AppConfig.env == 'mobile') {
      $(document).bind('deviceready', function() { ignite() });
    }
    else {
      $(function() { ignite() });
    }
  }
);
