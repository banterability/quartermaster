assert = require 'assertive'
User = require '../../lib/models/user'

describe 'User Model', ->
  describe 'inherited methods', ->
    before ->
      @user = new User

    it 'sets new attributes on model', ->
      @user.set 'name', 'Chip'
      assert.equal 'Chip', @user.attributes.name

    it 'gets existing attributes off model', ->
      assert.equal 'Chip', @user.get 'name'

    it 'gets all attributes off model', ->
      attributes = @user.toJSON()
      assert.deepEqual {name: 'Chip'}, attributes
