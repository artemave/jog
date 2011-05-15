describe 'Jog.Model.User', ->
  describe 'persistence', ->
    it 'should have method store', ->
      user = new Jog.Model.User
      expect(user).toHaveMethod('store')

    it 'should have class method fetch', ->
      expect(Jog.Model.User).toHaveMethod('fetch')

    it 'should be able to store user', ->
    it 'should be able to fetch stored user', ->
    it 'should return null if no user is stored', ->

  describe 'validation', ->
    it 'should have method valid', ->
      user = new Jog.Model.User
      expect(user).toHaveMethod('valid')

    it 'should be able to validate user', ->
