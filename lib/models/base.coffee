redis = require 'redis'
uuid = require 'node-uuid'

store = redis.createClient()

class BaseModel
  constructor: (options={}) ->
    @store = store
    @uuid = options.uuid || uuid.v1()

  dbKey: ->
    "quartermaster:#{@constructor.name}:#{@uuid}"

  get: (field, cb) ->
    key = @dbKey()
    @store.hget key, field, (err, results) ->
      cb err, results

  set: (field, value, cb) ->
    key = @dbKey()
    @store.hset key, field, value, (err, results) ->
      cb err, results

  toJSON: (cb) ->
    key = @dbKey()
    @store.hgetall key, (err, results) ->
      cb err, results


module.exports = BaseModel
