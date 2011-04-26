Jog.Controller.Posts = class extends Backbone.Controller
    routes:
      'posts/index': 'index'

    index: ->
      console.log context
