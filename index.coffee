express = require 'express'
fs = require 'fs'

config = JSON.parse fs.readFileSync 'config.json', encoding: 'utf-8'

app = express()

app.use require('body-parser')()
app.use require('morgan')('dev')

app.get '/', (req, res) ->
  renderFromFile res, 'index'

app.get '/join', (req, res) ->
  renderFromFile res, 'new_user'

app.post '/welcome', (req, res) ->
  console.log 'body', req.body
  renderFromFile res, 'thanks'

port = process.env.PORT || 5678
app.listen port, ->
  console.log "server up on #{port}…"

## Helpers

renderFromFile = (res, filename) ->
  fs.readFile "views/#{filename}.html", encoding: 'utf-8', (err, data) ->
    return res.send 500 if err
    res.setHeader 'Content-Type', 'text/html; charset=utf-8'
    res.send data
