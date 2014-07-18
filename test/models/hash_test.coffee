assert = require 'assertive'
mockRedis = require 'redis-mock'
HashModel = require '../../lib/models/hash'
Behaviors = require './shared_model_tests'

describe 'Hash Model', ->
  describe 'inherited methods', ->
    before ->
      @model = new HashModel store: mockRedis.createClient()

    Behaviors.behavesLikeAModel()
    Behaviors.behavesLikeAHashModel()
