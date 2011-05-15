require ['cs!migrations'], (migrations) ->
  jasmine.Matchers.prototype.toHaveMethod = (method) ->
    m = this.actual[method]
    m? and m instanceof Function

  orig_start = Jog.start
  Jog.start = ->
    migrations.run ->
      orig_start()
