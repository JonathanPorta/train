angular.module('train').service "storage", ($location, $rootScope)->

  base = "#{$location.protocol()}://#{$location.host()}:#{$location.port()}"

  console.log "service.coffee connecting to ", base

  socket = io.connect base

  socket.on 'news', (data) ->
    console.log 'Socket.io->incoming: ', data

    socket.emit 'my other event',
      my: 'data'

  socket
