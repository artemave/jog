describe "When app starts", ->
  afterEach ->
    Backbone.history.saveLocation('')

  it "should check if user is set", ->
    runs ->
      spyOn(Jog.Model.User, 'current')

      Jog.Sandbox.start()

    waitsFor ->
      Jog.Model.User.current.callCount == 1
    , 1000, 'user check'

  describe "and user is not set", ->
    it "should redirect to login screen", ->
      runs ->
        spyOn(Jog.Model.User, 'current').andCallFake -> null
        spyOn(Jog.Controller.Session.prototype, 'new').andCallFake -> null

        Jog.Sandbox.start()

      waitsFor ->
        Jog.Controller.session.new.callCount == 1
      , 1000, 'redirect to new session'

  describe 'and user is set', ->
    xit 'should validate user', ->
    describe 'and user is valid', ->
      xit 'should redirect to friends posts page', ->
    describe 'and user is invalid', ->
      xit 'should redirect to login screen', ->
