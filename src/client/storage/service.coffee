angular.module('train').service "storage", ($location, $rootScope)->

  base = "#{$location.protocol()}://#{$location.host()}:#{$location.port()}"

  socket = io.connect base

  socket.on 'server.connect', (data) ->
    console.log 'Socket.io->incoming: ', data

    socket.emit 'client.connect',
      msg: 'hello'

  socket
