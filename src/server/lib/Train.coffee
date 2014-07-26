MotorController = require './MotorController'

motors = require '../motors'

module.exports = class Train

  constructor: ->
    console.log "motors: ", motors
    if motors.train
      console.log "Using config from motors.coffee: ", motors.train
      @train = new MotorController motors.train
    else
      throw new Error "No MotorController specs are present in motors.json."

  forward: (speed) ->
    @train.forward @mapSpeed speed

  reverse: (speed) ->
    @train.reverse @mapSpeed speed

  stop: ->
    @train.speed -1

  speed: (speed) ->
    @train.speed @mapSpeed speed

  mapSpeed: (val) ->
    maxSpeed = 1023
    maxScaleSpeed = 10

    realValue = Math.floor((maxSpeed / maxScaleSpeed) * val)

    # console.log "Converted speed of #{ val } to #{ realValue }"

    realValue

