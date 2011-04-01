require({
    paths: { // RequireJS plugin aliases
      cs: 'vendor/rjs-cs',
      text: 'vendor/rjs-text-min'
    },
    priority: ['vendor/jquery-1.5.1.min', 'vendor/underscore-min']
  },
  ['cs!views/app', 'vendor/jquery-1.5.1.min', 'vendor/backbone-min', 'vendor/underscore-min'], function(app_view) {
    $(function() {
        try {
          window.App = new app_view;
        }
        catch (e) {
          alert(e);
        }
    });
  }
);
