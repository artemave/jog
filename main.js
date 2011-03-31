require({
    paths: { // RequireJS plugin aliases
      cs: 'vendor/rjs-cs',
      text: 'vendor/rjs-text-min'
    },
    priority: ['vendor/jquery-1.5.1.min', 'vendor/underscore-min']
  },
  ['cs!views/app', 'vendor/jquery-1.5.1.min', 'vendor/backbone-min', 'vendor/underscore-min', 'vendor/md5-min', 'vendor/rpc'], function(app_view) {
    $(function() {
        try {
          LjApi = new rpc.ServiceProxy(( location.protocol == "http:" ? '' : 'http://www.livejournal.com' ) + '/interface/xmlrpc', {
                protocol: 'XML-RPC',
                sanitize: false,
                methods: ['LJ.XMLRPC.getchallenge']
            });
          window.App = new app_view;
        }
        catch (e) {
          alert(e);
        }
    });
  }
);
