define ['backbone', 'cs!models/user'] ->
  class extends Backbone.Controller
    routes:
      ':context/posts/index': 'index'

    index: (context) ->
      console.log context
