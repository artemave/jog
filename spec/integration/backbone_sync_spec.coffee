describe 'Backbone.sync websql persistence strategy', ->
  model = {}
  options =
    success: ->
    error: ->

  beforeEach ->
    model = {}
    options =
      success: ->
      error: ->

  describe 'arguments', ->
    it 'should validate arguments', ->
      spyOn Backbone.persistence, 'validate_args'

      Backbone.persistence.sync 'create', model, options

      expect(Backbone.persistence.validate_args).toHaveBeenCalledWith('create', model, options)

    describe 'method argument', ->
      it 'should accept "create"', ->
        expect(-> Backbone.persistence.sync('create', model, options).not.toThrow(Error)
      it 'should accept "read"', ->
        expect(-> Backbone.persistence.sync('read', model, options).not.toThrow(Error)
      it 'should accept "update"', ->
        expect(-> Backbone.persistence.sync('update', model, options).not.toThrow(Error)
      it 'should accept "delete"', ->
        expect(-> Backbone.persistence.sync('delete', model, options).not.toThrow(Error)
      it 'should raise error on any other value', ->
        expect(-> Backbone.persistence.sync('someothermethod', model, options).not.toThrow(Error)

    describe 'model argument', ->
      it 'should have attributes hash', ->

    describe 'success argument', ->
      it 'should be a function', ->

    describe 'error argument', ->
      it 'should be a function', ->
