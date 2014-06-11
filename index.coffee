bodyParser = require 'body-parser'
express = require 'express'
fs = require 'fs'

config = JSON.parse fs.readFileSync 'config.json', encoding: 'utf-8'

app = express()

app.use bodyParser()

app.get '/', (req, res) ->
  renderFromFile res, 'index'


port = process.env.PORT || 5678
app.listen port, ->
  console.log "server up on #{port}…"

## Helpers

renderFromFile = (res, filename) ->
  fs.readFile "views/#{filename}.html", encoding: 'utf-8', (err, data) ->
    return res.send 500 if err
    res.setHeader 'Content-Type', 'text/html; charset=utf-8'
    res.send data
