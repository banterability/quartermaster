BaseModel = require './base'

class CounterModel extends BaseModel
  get: (cb) ->
    @store.get @key, (err, results) ->
      results = parseInt(results, 10) || 0
      cb err, results

  incr: (cb) ->
    @_changeBy 1, cb

  decr: (cb) ->
    @_changeBy -1, cb

  _changeBy: (amount, cb) ->
    @get (err, results) =>
      results += amount
      @store.set @key, results, cb

module.exports = CounterModel
