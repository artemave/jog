Jog.Model.User = class extends Backbone.Model
  @fetch: ->
    console.log "fetch called"

  store: ->
    console.log 'load called'

  valid: ->
    console.log 'valid called'
