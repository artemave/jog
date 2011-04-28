Jog.Controller.Posts = class extends Backbone.Controller
    routes:
      'posts/index/:context': 'index'

    index: (context) ->
      console.log "posts controller called in context #{context}"
