configureTemplates = require './lib/templates'
express = require 'express'
redis = require 'redis'
List = require './lib/models/list'
Counter = require './lib/models/counter'

app = express()

app.use require('body-parser')()
app.use require('morgan')('dev')
app.use '/assets', express.static "#{__dirname}/public" unless app.get 'env' == 'production'

configureTemplates(app)

store = redis.createClient()
DEV_LIST = new List {uuid: 'c99fed70-f8b4-11e3-bc46-5bc2a81b342d', store}
ALL_TIME_COUNTER = new Counter {uuid: 'dca73e00-0ea8-11e4-b13c-535d313891d7', store}

app.get '/', (req, res) ->
  DEV_LIST.getAll (err, items) ->
    throw new Error if err
    res.locals.list = items.map (item) -> {name: item}
    ALL_TIME_COUNTER.get (err, count) ->
      res.locals.count = count || 0
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
