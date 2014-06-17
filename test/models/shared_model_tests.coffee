assert = require 'assertive'

module.exports.behavesLikeAModel = ->
  it 'generates a new uuid', ->
    assert.truthy @model.uuid

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
