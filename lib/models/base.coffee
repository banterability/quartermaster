uuid = require 'node-uuid'

class BaseModel
  constructor: (options={}) ->
    @store = options.store
    @uuid = options.uuid || uuid.v1()
    @key = @dbKey()

  dbKey: ->
    "quartermaster:#{@constructor.name}:#{@uuid}"

module.exports = BaseModel
