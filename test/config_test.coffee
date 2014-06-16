assert = require 'assertive'
bond = require 'bondjs'
fs = require 'fs'
loadConfig = require '../lib/config'

SAMPLE_CONFIG = 'config.json.example'

describe 'Config', ->
  before ->
    bond(fs, 'readFileSync').through()

  it 'loads the passed file from disk', ->
    loadConfig SAMPLE_CONFIG
    assert.equal 1, fs.readFileSync.called

  it 'parses the passed file as JSON', ->
    config = loadConfig SAMPLE_CONFIG
    assert.equal '555-3812', config.twilio.phoneNumber
