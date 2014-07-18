assert = require 'assertive'
mockRedis = require 'redis-mock'
CounterModel = require '../../lib/models/counter'
Behaviors = require './shared_model_tests'

describe 'Counter Model', ->
  describe 'inherited methods', ->
    before ->
      @model = new CounterModel store: mockRedis.createClient()

    Behaviors.behavesLikeAModel()
    Behaviors.behavesLikeACounterModel()
