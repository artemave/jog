define ['vendor/jade', 'text!views/app.jade'], (jade, template) ->
  class AppView extends Backbone.View

    initialize: ->
      $('body').append $(this.el)
      this.render()

    render: ->
      LjApi.LJ.XMLRPC.getchallenge
        params: []
        onSuccess: (res) =>
          $(this.el).html(jade.render(template, {locals: { authtoken: res.challenge }}))

