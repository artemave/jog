Jog.Controller.Main = class extends Backbone.Controller
  start: ->
    unless Jog.Model.User.current()
      window.location.hash = 'session/new'
    else
      window.location.hash = 'posts/index'

