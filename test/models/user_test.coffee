assert = require 'assertive'
User = require '../../lib/models/user'
ModelTests = require './shared_model_tests'

describe 'User Model', ->
  describe 'inherited methods', ->
    before ->
      @model = new User

    ModelTests.behavesLikeAModel()
