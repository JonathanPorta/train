angular.module('train').filter 'direction', ->
  (speed) ->
    formatted = "Stopped."
    speed = if speed < 0 then Math.ceil(speed) else Math.floor(speed)
    if speed < 0
      formatted = "Reverse."
    else if speed > 0
      formatted = "Forward."

    console.log "Direction filter: #{ speed } -> #{ formatted }"

    formatted
