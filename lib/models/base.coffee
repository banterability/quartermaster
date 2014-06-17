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

class HashModel extends BaseModel
  get: (field, cb) ->
    @store.hget @key, field, (err, results) ->
      cb err, results

  set: (field, value, cb) ->
    @store.hset @key, field, value, (err, results) ->
      cb err, results

  toJSON: (cb) ->
    @store.hgetall @key, (err, results) ->
      cb err, results


module.exports = {HashModel}
