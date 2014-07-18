redis = require 'redis'
uuid = require 'node-uuid'

store = redis.createClient()

class BaseModel
  constructor: (options={}) ->
    @store = store
    @uuid = options.uuid || uuid.v1()
    @key = @dbKey()

  dbKey: ->
    "quartermaster:#{@constructor.name}:#{@uuid}"

module.exports = BaseModel
