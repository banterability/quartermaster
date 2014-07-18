assert = require 'assertive'
redis = require 'fakeredis'
ListModel = require '../../lib/models/list'
Behaviors = require './shared_model_tests'

describe 'List Model', ->
  describe 'inherited methods', ->
    before ->
      @model = new ListModel store: redis.createClient()

    Behaviors.behavesLikeAModel()
    Behaviors.behavesLikeAListModel()
