MotorController = require './MotorController'
NumberValidator = require "./NumberValidator"

motors = require '../motors'

module.exports = class Train

  constructor: ->

    # initial speed should be 0
    @_currentSpeed = 0

    if motors.train
      console.log "Using config from motors.coffee: ", motors.train
      @train = new MotorController motors.train
    else
      throw new Error "No MotorController specs are present in motors.json."

  # only positive speed value accepted.
  forward: (speed) ->
    console.log "Train.coffee->forward(#{ speed })"
    @train.forward @_mapSpeed speed

  # only positive speed value accepted.
  reverse: (speed) ->
    console.log "Train.coffee->reverse(#{ speed })"
    @train.reverse @_mapSpeed speed

  stop: ->
    console.log "Train.coffee->stop()"
    @train.speed -1

  # accepts positive or negative speed. positive speed is forward, negative is backwards.
  speed: (speed = null) ->
    if speed isnt null
      # Setter
      console.log "Train.coffee->speed(#{ speed }) - setter"
      speed = NumberValidator.defaultTo -10, 10, Math.floor(speed), 0
      console.log "Train.coffee->speed - converted to #{ speed }"

      if speed is 0
        @stop()
      else if speed < 0
        @reverse Math.abs speed
      else
        @forward speed

      @_currentSpeed = speed
    else
      # Getter
      console.log "Train.coffee->speed() - getter"
      @_currentSpeed


  # only accepts positive values.
  _mapSpeed: (value) ->
    maxSpeed = 1023
    maxScaleSpeed = 10

    realValue = Math.floor((maxSpeed / maxScaleSpeed) * value)

    console.log "Train.coffee->_mapSpeed(#{ value } => #{ realValue }"

    realValue

