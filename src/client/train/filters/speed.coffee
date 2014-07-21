angular.module('train').filter 'speed', ->
  (speed) ->
    formatted = Math.floor Math.abs speed
    console.log "speed filter: #{ speed } -> #{ formatted }"
    formatted
