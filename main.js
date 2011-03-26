require({
    paths: { // RequireJS plugin aliases
      cs: 'lib/rjs-cs',
      text: 'lib/rjs-text-min'
    },
    priority: ['lib/jquery-1.5.1.min', 'lib/underscore-min']
  },
  ['cs!views/app', 'lib/jquery-1.5.1.min', 'lib/backbone-min', 'lib/underscore-min'], function(app_view) {
    $(function() {
      window.App = new app_view;
    });
  }
);
