angular.module('train').filter 'gear', ->
  (speed) ->
    formatted = "p"
    speed = if speed < 0 then Math.ceil(speed) else Math.floor(speed)
    if speed < 0
      formatted = "r"
    else if speed > 0
      formatted = "d"

    console.log "Gears filter: #{ speed } -> #{ formatted }"

    formatted
