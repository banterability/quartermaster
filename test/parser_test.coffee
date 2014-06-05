assert = require 'assertive'
Parser = require '../lib/parser'

describe 'Language Parsing', ->
  it 'exists', ->
    assert.expect Parser

  describe 'adding an item to the list', ->
    ['Get eggs', 'need eggs', 'buy eggs'].forEach (phrase) ->
      it "understands '#{phrase}'", ->
        understanding = new Parser(phrase).understand()
        assert.equal 'add', understanding.intent
        assert.equal 'eggs', understanding.content

  describe 'removing an item from the list', ->
    ['got eggs', 'have eggs', 'Bought eggs'].forEach (phrase) ->
      it "understands '#{phrase}'", ->
        understanding = new Parser(phrase).understand()
        assert.equal 'remove', understanding.intent
        assert.equal 'eggs', understanding.content
