Jog.Config = class
  constructor: (opts) ->
    opts = _(opts).defaults
      env: 'development'

    this.env = opts.env
    this.current_device = if location.protocol is 'http:' then 'desktop' else 'mobile'
    this.ljapi_url = ( if this.current_device is 'mobile' then 'http://www.livejournal.com' else '' ) + '/interface/xmlrpc'

    persistence.store.websql.config(persistence, "jog_#{this.env}", 'A database description', 5 * 1024 * 1024)

    # stub out phonegap api to run in firebug
    if this.current_device is 'desktop' and navigator.userAgent.match(/Firefox/)
      apis = ['notification']

      _(apis).each (api) ->
        if not navigator[api]?
          navigator[api] = {}
          # __noSuchMethod__ only works in firefox
          navigator[api].__noSuchMethod__ = (fname, args) ->
            console.log "#{fname} called with [#{args}]"

