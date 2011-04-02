define ['vendor/jade', 'text!views/app.jade', 'cs!lib/lj-client'], (jade, template, LjSession) ->
  class AppView extends Backbone.View

    initialize: ->
      $('body').append $(this.el)
      @session = new LjSession('artemave', 'secret')
      this.render()

    render: ->
      @session.checkfriends
        callback: (res) =>
          console.log(res)
          #$(this.el).html(jade.render(template, {locals: {login: res}}))

