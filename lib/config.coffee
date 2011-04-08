define () ->
  class AppConfig
    constructor: ->
      this.env = if location.protocol is 'http:' then 'desktop' else 'mobile'
      this.ljapi_url = ( if this.env is 'mobile' then 'http://www.livejournal.com' else '' ) + '/interface/xmlrpc'

      # stub out phonegap api to run in firebug
      if this.env is 'desktop'
        apis = ['notification']

        _(apis).each (api) ->
          if not navigator[api]?
            navigator[api] = {}
            # __noSuchMethod__ only works in firefox
            navigator[api].__noSuchMethod__ = (fname, args) ->
              console.log "#{fname} called with [#{args}]"
