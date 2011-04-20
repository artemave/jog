App.Controller.Main = class extends Backbone.Controller
  start: ->
    unless App.Model.User.current()
      window.location.hash = 'session/new'
    else
      window.location.hash = 'friends/posts/index'

