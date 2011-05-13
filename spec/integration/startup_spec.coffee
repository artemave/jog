describe "When app starts", ->
  afterEach ->
    waitsFor ->
      Backbone.history.saveLocation('')
      window.location.hash == ''

  it "should check if user is set", ->
      runs ->
        spyOn(Jog.Model.User, 'fetch')
        Jog.start()

      waitsFor ->
        Jog.Model.User.fetch.callCount == 1
      , 1000, 'user check existence'


  describe "and user is not set", ->
    it "should redirect to login screen", ->
      runs ->
        spyOn(Jog.Model.User, 'fetch')
        spyOn(Jog.Controller.Session.prototype, 'new')

        Jog.start()

      waitsFor ->
        window.app

      waitsFor ->
        window.app.controllers.session.new.callCount == 1
      , 1000, 'redirect to new session'



  describe 'and user is set', ->
    it 'should validate user', ->
      runs ->
        this.user = valid: ->

        spyOn(Jog.Model.User, 'fetch').andReturn this.user
        spyOn(this.user, 'valid')

        Jog.start()

      waitsFor ->
        this.user.valid.callCount == 1
      , 1000, 'user validation check'

    describe 'and user is valid', ->
      it 'should redirect to friends posts page', ->
        runs ->
          this.user = valid: -> true

          spyOn(Jog.Model.User, 'fetch').andReturn this.user
          spyOn(Jog.Controller.Posts.prototype, 'index')

          Jog.start()

        waitsFor ->
          window.app

        waitsFor ->
          window.app.controllers.posts.index.callCount == 1
        , 1000, 'redirect to friends posts'

        runs ->
          expect( window.app.controllers.posts.index ).toHaveBeenCalledWith 'friends'

    describe 'and user is invalid', ->
      it 'should redirect to login screen', ->
        runs ->
          this.user = valid: -> false

          spyOn(Jog.Model.User, 'fetch').andReturn this.user
          spyOn(Jog.Controller.Session.prototype, 'new')

          Jog.start()

        waitsFor ->
          window.app

        waitsFor ->
          window.app.controllers.session.new.callCount == 1
        , 1000, 'redirect to new session'
