assert = require 'assertive'
{CounterModel} = require '../../lib/models/base'
Behaviors = require './shared_model_tests'

describe 'Counter Model', ->
  describe 'inherited methods', ->
    before ->
      @model = new CounterModel

    Behaviors.behavesLikeAModel()
    Behaviors.behavesLikeACounterModel()
