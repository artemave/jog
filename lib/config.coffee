env = if location.protocol is 'http:' then 'web' else 'native'

window.AppConfig =
  env: env
  ljapi_url: ( if env is 'web' then '' else 'http://www.livejournal.com' ) + '/interface/xmlrpc'
