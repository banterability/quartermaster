assert = require 'assertive'

behavesLikeAModel = ->
  describe 'shared model behaviors', ->
    it 'generates a new uuid', ->
      assert.truthy @model.uuid

    it 'generates a unique Redis key', ->
      assert.equal "quartermaster:#{@model.constructor.name}:#{@model.uuid}", @model.dbKey()

behavesLikeACounterModel = ->
  describe 'shared counter model behaviors', ->
    it 'returns 0 if count is undefined', ->
      @model.get (err, value) ->
        assert.equal 0, value

    it 'increments counter twice', ->
      @model.incr (err, value) =>
        @model.incr (err, value) =>
          @model.get (err, value) ->
            assert.equal 2, value

    it 'decrements counter', ->
      @model.decr (err, value) =>
        @model.get (err, value) ->
          assert.equal 1, value

    it 'returns correct count', ->
      @model.get (err, value) ->
        assert.equal 1, value

behavesLikeAHashModel = ->
  describe 'shared hash model behaviors', ->
    it 'sets new attributes on model', ->
      @model.set 'name', 'Chip', =>
        @model.get 'name', (err, value) ->
          assert.equal 'Chip', value

    it 'gets existing attributes off model', ->
      @model.get 'name', (err, value) ->
        assert.equal 'Chip', value

    it 'gets all attributes off model', ->
      attributes = @model.getAll (err, data) ->
        assert.deepEqual {name: 'Chip'}, data

behavesLikeAListModel = ->
  describe 'shared list model behaviors', ->
    before ->
      @model.push 'apple', ->
      @model.push 'banana', ->
      @model.push 'cherry', ->

    it 'push new item into model', ->
      @model.push 'date', =>
        @model.getAll (err, list) ->
          assert.equal 4, list.length
          assert.equal 'date', list.pop()

    it 'pops last item off model', ->
      @model.pop (err, item) ->
        assert.equal 'date', item

    it 'gets all items in model', ->
      @model.getAll (err, list) ->
        assert.equal 3, list.length
        assert.deepEqual ['apple', 'banana', 'cherry'], list

    it 'removes an item by value', ->
      @model.remove 'banana', (err, removed) =>
        assert.equal 1, removed
        @model.getAll (err, list) ->
          assert.equal 2, list.length
          assert.deepEqual ['apple', 'cherry'], list

module.exports = {
  behavesLikeAModel
  behavesLikeACounterModel
  behavesLikeAHashModel
  behavesLikeAListModel
}
