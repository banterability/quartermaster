express = require 'express'
List = require './lib/models/list'

app = express()

app.use require('body-parser')()
app.use require('morgan')('dev')
app.use '/assets', express.static "#{__dirname}/public" unless app.get 'env' == 'production'

app.set 'view engine', 'mustache'
app.set 'layout', 'layout'
app.set 'partials', list_item: 'list_item'
# app.enable 'view cache'
app.engine 'mustache', require 'hogan-express'

DEV_LIST = new List {uuid: 'c99fed70-f8b4-11e3-bc46-5bc2a81b342d'}

app.get '/', (req, res) ->
  DEV_LIST.getAll (err, items) ->
    throw new Error if err
    res.locals.list = items.map (item) -> {name: item}
    res.render 'index'

app.post '/items/create', (req, res) ->
  item = req.body.name
  DEV_LIST.push item, (err, response) ->
    res.locals = {name: item}
    res.render 'list_item', layout: null

app.post '/items/delete', (req, res) ->
  DEV_LIST.remove req.body.name, (err, count) ->
    res.send 204

port = process.env.PORT || 5678
app.listen port, ->
  console.log "#{app.get 'env'} server up on #{port}…"
