persistence.defineMigration 1,
  up: ->
    this.createTable 'users', (table) ->
      table.text 'username'
      table.text 'password'

    this.addIndex 'users', 'username', true

  down: ->
    this.removeIndex 'users', 'username'
    this.dropTable 'users'
