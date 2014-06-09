express = require 'express'
fs = require 'fs'

config = JSON.parse fs.readFileSync 'config.json', encoding: 'utf-8'

app = express()


port = process.env.PORT || 5678
app.listen port, ->
  console.log "server up on #{port}…"
