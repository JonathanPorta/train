Train = require "./lib/Train"

path = require "path"
express = require "express"

root = path.join __dirname, "..", ".."

port = process.env.PORT || 3000

train = new Train

app = express()
server = require('http').Server(app)
io = require('socket.io')(server)

# express routers/middleware
app.use require "./middleware/log"
app.use '/assets', require './routers/assets'

app.get '/', (req, res) ->
  res.sendfile path.join root, "build", "index.html"

# Socket.io
io.on "connection", (socket) ->
  socket.emit 'server.connect',
    msg: 'welcome'

  socket.on 'client.connect', (data) ->
    console.log "New client connection: ", data

  socket.on 'train.speed', (data) =>
    console.log "Train Speed Received: ", data
    train.speed data.speed

    # Let the UI know the speed changed.
    socket.broadcast.emit 'train.speed',
      speed: train.speed()

module.exports = do ->
  serve: ->
    server.listen port
    console.log "Train Server listening on port #{port}"
  stop: ->
    server?.close()
