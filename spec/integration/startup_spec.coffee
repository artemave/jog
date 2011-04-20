describe "When app starts", ->
  it "should check if user is set", sinon.test ->
    App.Model.User = current: this.spy()
    app = new App.Controller.Main
    app.start()
    ( expect App.Model.User.current.called ).toBeTruthy()

  describe "... and user is not set", ->
    xit "should prompt for login details", ->

  xit 'should check that the user login is correct', ->

  describe '... and user login is correct', ->
    xit 'should open friends page', ->
