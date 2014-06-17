assert = require 'assertive'
User = require '../../lib/models/user'
ModelTests = require './shared_model_tests'

describe 'User Model', ->
  describe 'inherited methods', ->
    before ->
      @model = new User

    ModelTests.behavesLikeAModel()

  describe 'isActive', ->
    it 'returns the value of the "active" property', ->
      activeUser = new User
      activeUser.set 'active', true
      assert.equal true, activeUser.isActive()

    it 'defaults to false', ->
      inactiveUser = new User
      assert.equal false, inactiveUser.isActive()
