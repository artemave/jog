jasmine.Matchers.prototype.toHaveMethod = (method) ->
  m = this.actual[method]
  m? and m instanceof Function
