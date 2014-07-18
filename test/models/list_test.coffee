assert = require 'assertive'
ListModel = require '../../lib/models/list'
Behaviors = require './shared_model_tests'

describe 'List Model', ->
  describe 'inherited methods', ->
    before ->
      @model = new ListModel

    Behaviors.behavesLikeAModel()
    Behaviors.behavesLikeAListModel()