define ['vendor/jade', 'text!views/app.jade', 'cs!lib/lj-client'], (jade, template, lj) ->
  class AppView extends Backbone.View

    initialize: ->
      $('body').append $(this.el)
      this.render()

    render: ->
      lj.getchallenge
        params: []
        onSuccess: (res) =>
          $(this.el).html(jade.render(template, {locals: { authtoken: res.challenge }}))

