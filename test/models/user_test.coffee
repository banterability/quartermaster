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
      activeUser.set 'active', true, ->
        activeUser.isActive (err, bool) ->
          assert.equal true, bool

    it 'defaults to false', ->
      inactiveUser = new User
      inactiveUser.isActive (err, bool) ->
        assert.equal false, bool
