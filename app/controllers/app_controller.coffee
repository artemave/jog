Jog.Controller.Main = class extends Backbone.Controller
  start: ->
    current_user = Jog.Model.User.current()

    if current_user? and current_user.valid()
      window.location.hash = 'posts/index/friends'
    else
      window.location.hash = 'session/new'

