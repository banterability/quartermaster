async = require 'async'
express = require 'express'
redis = require 'redis'

Counter = require './lib/models/counter'
List = require './lib/models/list'

app = express()

app.use require('body-parser')()
app.use require('morgan')('dev')
app.use '/assets', express.static "#{__dirname}/public" unless app.get 'env' == 'production'

partials =
  list_item: 'list_item'
  stats: 'summary'
  new_item: 'new_item'

module.exports = (app) ->
  app.set 'view engine', 'mustache'
  app.set 'layout', 'layout'
  app.set 'partials', partials
  app.enable 'view cache' if app.get 'env' == 'production'
  app.engine 'mustache', require 'hogan-express'

store = redis.createClient()
DEV_LIST = new List uuid: 'c99fed70-f8b4-11e3-bc46-5bc2a81b342d', store
ALL_TIME_COUNTER = new Counter uuid: 'dca73e00-0ea8-11e4-b13c-535d313891d7', store

app.get '/', (req, res) ->
  queries =
    listItems: (cb) -> DEV_LIST.getAll cb
    counter: (cb) -> ALL_TIME_COUNTER.get cb

  async.parallel queries, (err, results) ->
    throw new Error if err
    {listItems, counter} = results
    res.locals.list = listItems.map (item) -> {name: item}
    res.locals.count = counter || 0
    res.render 'index'

app.post '/items/create', (req, res) ->
  item = req.body.name
  DEV_LIST.push item, (err, response) ->
    res.locals = {name: item}
    res.render 'list_item', layout: null

app.post '/items/delete', (req, res) ->
  DEV_LIST.remove req.body.name, (err, count) ->
    ALL_TIME_COUNTER.incr ->
    res.send 204

port = process.env.PORT || 5678
app.listen port, ->
  console.log "#{app.get 'env'} server up on #{port}…"
