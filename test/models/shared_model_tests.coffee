assert = require 'assertive'

module.exports.behavesLikeAModel = ->
  it 'sets new attributes on model', ->
    @model.set 'name', 'Chip'
    assert.equal 'Chip', @model.attributes.name

  it 'gets existing attributes off model', ->
    assert.equal 'Chip', @model.get 'name'

  it 'gets all attributes off model', ->
    attributes = @model.toJSON()
    assert.deepEqual {name: 'Chip'}, attributes
