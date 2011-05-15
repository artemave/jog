define ['cs!migrations/10_users'], ->
  run: (callback) ->
    persistence.migrations.init ->
      persistence.migrate ->
        callback()
