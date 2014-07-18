assert = require 'assertive'
redis = require 'fakeredis'
CounterModel = require '../../lib/models/counter'
Behaviors = require './shared_model_tests'

describe 'Counter Model', ->
  describe 'inherited methods', ->
    before ->
      @model = new CounterModel store: redis.createClient()

    Behaviors.behavesLikeAModel()
    Behaviors.behavesLikeACounterModel()
