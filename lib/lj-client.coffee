define ['vendor/rpc', 'vendor/md5-min'], () ->

  proxy = if location.protocol is "http:" then '' else 'http://www.livejournal.com'

  LjApi = new rpc.ServiceProxy "#{proxy}/interface/xmlrpc", {
    protocol: 'XML-RPC'
    sanitize: false
    methods: ['LJ.XMLRPC.getchallenge']
  }

  LjApi.LJ.XMLRPC
