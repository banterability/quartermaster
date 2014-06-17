assert = require 'assertive'
List = require '../../lib/models/list'
Behaviors = require './shared_model_tests'

describe 'List Model', ->
  describe 'inherited methods', ->
    before ->
      @model = new List

    Behaviors.behavesLikeAModel()
    Behaviors.behavesLikeAListModel()