Jog.Controller.Session = class extends Backbone.Controller
  routes:
    'session/new': 'new'

  new: ->
    console.log "new session called!"
