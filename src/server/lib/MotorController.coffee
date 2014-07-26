GPIOPin = require './GPIOPin'

module.exports = class MotorController

  constructor: (options) ->
    @forwardPin = new GPIOPin options.forwardPinNumber
    @reversePin = new GPIOPin options.reversePinNumber
    @enablePin = new GPIOPin options.enablePinNumber

    @variableSpeed = options.variableSpeed

    console.log "MotorController - Created:",
      forwardPin: options.forwardPinNumber
      reversePin: options.reversePinNumber
      enablePin: options.enablePinNumber
      variableSpeed: options.variableSpeed

  forward: (speed) ->
    # console.log "MotorController->forward(#{ speed })"
    @forwardPin.out 1
    @reversePin.out 0
    @speed speed

  reverse: (speed) ->
    # console.log "MotorController->reverse(#{ speed })"
    @forwardPin.out 0
    @reversePin.out 1
    @speed speed

  speed: (val) ->
    # console.log "MotorController->speed(#{ val })"
    if val <= 0
      # console.log "MotorController - Stopping motor."
      @enablePin.out 0

    else if @variableSpeed
      # console.log "MotorController - Writing PWM signal for speed."
      # TODO: Provide a way to map the speed values to the underlying values.
      @enablePin.pwm val

    else
      # console.log "MotorController - Starting motor."
      @enablePin.out 1
