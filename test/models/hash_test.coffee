assert = require 'assertive'
redis = require 'fakeredis'
HashModel = require '../../lib/models/hash'
Behaviors = require './shared_model_tests'

describe 'Hash Model', ->
  describe 'inherited methods', ->
    before ->
      @model = new HashModel store: redis.createClient()

    Behaviors.behavesLikeAModel()
    Behaviors.behavesLikeAHashModel()
