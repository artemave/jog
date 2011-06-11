describe 'persistence.js extension to Backbone.Model', ->
  persistence.store.websql.config persistence, 'test_backbone_persistence', '', 10240

  it 'should allow to define model schema', ->
    err = jasmine.createSpy()
    suc = jasmine.createSpy()

    persistence.transaction (tx) ->
      tx.executeSql 'DROP TABLE IF EXISTS posts'

    class Post extends Backbone.Model
      Backbone.persistence.call this, 'posts',
        title: 'TEXT'
        text: 'TEXT'
        author_id: 'INT'

    persistence.schemaSync()
    persistence.transaction (tx) ->
      tx.executeSql 'INSERT INTO posts (title, text, author_id) VALUES ("blah", "lots of text", 1)'
    , suc, err

    expect(suc).toHaveBeenCalled()
    expect(err).not.toHaveBeenCalled()

  it 'should expose pjs constructor api'

  it 'should fetch model instance from db'
  it 'should save new instance to db'
  it 'should save changes to existing model to db'
  it 'should delete model instance from db'


