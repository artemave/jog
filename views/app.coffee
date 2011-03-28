define ['vendor/jade', 'text!views/app.jade'], (jade, template) ->
  class AppView extends Backbone.View

    initialize: ->
      $('body').append $(this.el)
      this.render()

    render: ->
      $(this.el).html(jade.render(template, {}))

