require({
    paths: {cs: 'lib/rjs-cs', text: 'lib/rjs-text-min'},
    priority: ['lib/jquery', 'lib/underscore-min']
  },
  ['cs!views/app', 'lib/jquery', 'lib/backbone-min', 'lib/underscore-min'], function(app_view) {
    window.App = new app_view
  }
);
