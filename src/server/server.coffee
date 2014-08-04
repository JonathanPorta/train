Train = require "./lib/Train"
path = require "path"
express = require "express"

root = path.join __dirname, "..", ".."

port = process.env.PORT || 3000

train = new Train

app = express()
server = require('http').Server(app)
io = require('socket.io')(server)

app.use require "./middleware/log"

app.use '/assets', require './routers/assets'

app.get '/', (req, res) ->
	res.sendfile path.join root, "build", "index.html"

# Socket.io
io.on "connection", (socket) ->
	socket.emit 'news',
		hello: 'world'

	socket.on 'my other event', (data) ->
		console.log "my other event receievd", data

	socket.on 'train.speed', (data) =>
		console.log "Train Speed Received: ", data
		if data.speed is 0
			train.stop()
		else if data.speed < 0
			train.reverse Math.abs data.speed
		else
			train.forward data.speed

module.exports = do ->
	serve: ->
		server.listen port
		console.log "Train Server listening on port #{port}"
	stop: ->
		server?.close()
