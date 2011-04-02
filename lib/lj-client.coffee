define ['vendor/rpc', 'vendor/md5-min'], () ->

  class Session
    constructor: (username, password) ->

      proxy = if location.protocol is 'http:' then '' else 'http://www.livejournal.com'
      pub_methods = ['LJ.XMLRPC.login', 'LJ.XMLRPC.checkfriends']

      ljapi = new rpc.ServiceProxy "#{proxy}/interface/xmlrpc", {
        protocol: 'XML-RPC'
        sanitize: false
        methods: pub_methods.concat ['LJ.XMLRPC.getchallenge']
      }

      # wrap each public method in getchallenge
      # and get rid of LJ.XMLRPC. prefix
      _(pub_methods).each (method) =>
        pub_name = ( method.match /LJ.XMLRPC.(.*)/ )[1]
        this[pub_name] = (opts = {}) ->
          ljapi.LJ.XMLRPC.getchallenge
            params: []
            onException: (e) ->
              alert(e)
            onSuccess: (chal_res) ->
              chal_key = hex_md5(chal_res.challenge + (hex_md5 password))
              ljapi.LJ.XMLRPC[pub_name]
                params: [
                  _.defaults (opts.args || {}), {
                    ver: 1
                    username: username
                    auth_method: 'challenge'
                    auth_challenge: chal_res.challenge
                    auth_response: chal_key
                  }
                ]
                onSuccess: opts.callback
                onException: (e) ->
                  alert(e)
