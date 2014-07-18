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

class CounterModel extends BaseModel
  get: (cb) ->
    @store.get @key, (err, results) ->
      cb err, results

  incr: (cb) ->
    @_changeBy 1, cb

  decr: (cb) ->
    @_changeBy -1, cb

  _changeBy: (amount, cb) ->
    @get (err, results=0) =>
      results = parseInt(results, 10) + amount
      @store.set @key, results, (err, results) ->
        cb err, results

class HashModel extends BaseModel
  get: (field, cb) ->
    @store.hget @key, field, (err, results) ->
      cb err, results

  set: (field, value, cb) ->
    @store.hset @key, field, value, (err, results) ->
      cb err, results

  getAll: (cb) ->
    @store.hgetall @key, (err, results) ->
      cb err, results

class ListModel extends BaseModel
  push: (item, cb) ->
    @store.rpush @key, item, (err, results) ->
      cb err, results

  pop: (cb) ->
    @store.rpop @key, (err, results) ->
      cb err, results

  getAll: (cb) ->
    @store.lrange @key, 0, -1, (err, results) ->
      cb err, results

  remove: (item, cb) ->
    @store.lrem @key, 0, item, (err, results) ->
      cb err, results

module.exports = {CounterModel, HashModel, ListModel}
