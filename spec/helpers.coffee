Jog.Sandbox =
  start: ->
    try
      Jog.start()
    catch e
      unless e.message is 'Backbone.history has already been started'
        throw e
