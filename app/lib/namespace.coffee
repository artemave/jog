if window.namespace?
  throw "window.namespace already defined"

window.namespace = (target, name, block) ->
  [target, name, block] = [exports ? window, arguments...] if arguments.length < 3
  top    = target
  target = target[item] or= {} for item in name.split '.'
  block target, top
