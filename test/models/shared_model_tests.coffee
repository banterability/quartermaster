assert = require 'assertive'

module.exports.behavesLikeAHashModel = ->
  it 'generates a new uuid', ->
    assert.truthy @model.uuid

  it 'generates a unique Redis key', ->
    assert.equal "quartermaster:#{@model.constructor.name}:#{@model.uuid}", @model.dbKey()

  it 'sets new attributes on model', ->
    @model.set 'name', 'Chip', =>
      @model.get 'name', (err, value) ->
        assert.equal 'Chip', value

  it 'gets existing attributes off model', ->
    @model.get 'name', (err, value) ->
      assert.equal 'Chip', value

  it 'gets all attributes off model', ->
    attributes = @model.toJSON (err, data) ->
      assert.deepEqual {name: 'Chip'}, data
