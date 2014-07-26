 # +-----+-----+---------+------+---+--B Plus--+---+------+---------+-----+-----+
 # | BCM | wPi |   Name  | Mode | V | Physical | V | Mode | Name    | wPi | BCM |
 # +-----+-----+---------+------+---+----++----+---+------+---------+-----+-----+
 # |     |     |    3.3v |      |   |  1 || 2  |   |      | 5v      |     |     |
 # |   2 |   8 |   SDA.1 | ALT0 | 1 |  3 || 4  |   |      | 5V      |     |     |
 # |   3 |   9 |   SCL.1 | ALT0 | 1 |  5 || 6  |   |      | 0v      |     |     |
 # |   4 |   7 | GPIO. 7 |  OUT | 0 |  7 || 8  | 1 | ALT0 | TxD     | 15  | 14  |
 # |     |     |      0v |      |   |  9 || 10 | 1 | ALT0 | RxD     | 16  | 15  |
 # |  17 |   0 | GPIO. 0 |  OUT | 0 | 11 || 12 | 1 | ALT5 | GPIO. 1 | 1   | 18  |
 # |  27 |   2 | GPIO. 2 |  OUT | 0 | 13 || 14 |   |      | 0v      |     |     |
 # |  22 |   3 | GPIO. 3 |   IN | 0 | 15 || 16 | 0 | IN   | GPIO. 4 | 4   | 23  |
 # |     |     |    3.3v |      |   | 17 || 18 | 0 | IN   | GPIO. 5 | 5   | 24  |
 # |  10 |  12 |    MOSI | ALT0 | 0 | 19 || 20 |   |      | 0v      |     |     |
 # |   9 |  13 |    MISO | ALT0 | 0 | 21 || 22 | 0 | IN   | GPIO. 6 | 6   | 25  |
 # |  11 |  14 |    SCLK | ALT0 | 0 | 23 || 24 | 1 | ALT0 | CE0     | 10  | 8   |
 # |     |     |      0v |      |   | 25 || 26 | 1 | ALT0 | CE1     | 11  | 7   |
 # |   0 |  30 |   SDA.0 | ALT0 | 0 | 27 || 28 | 0 | ALT0 | SCL.0   | 31  | 1   |
 # |   5 |  21 | GPIO.21 |   IN | 0 | 29 || 30 |   |      | 0v      |     |     |
 # |   6 |  22 | GPIO.22 |   IN | 0 | 31 || 32 | 0 | IN   | GPIO.26 | 26  | 12  |
 # |  13 |  23 | GPIO.23 |   IN | 0 | 33 || 34 |   |      | 0v      |     |     |
 # |  19 |  24 | GPIO.24 |   IN | 0 | 35 || 36 | 0 | IN   | GPIO.27 | 27  | 16  |
 # |  26 |  25 | GPIO.25 |   IN | 0 | 37 || 38 | 0 | IN   | GPIO.28 | 28  | 20  |
 # |     |     |      0v |      |   | 39 || 40 | 0 | IN   | GPIO.29 | 29  | 21  |
 # +-----+-----+---------+------+---+----++----+---+------+---------+-----+-----+
 # | BCM | wPi |   Name  | Mode | V | Physical | V | Mode | Name    | wPi | BCM |
 # +-----+-----+---------+------+---+--B Plus--+---+------+---------+-----+-----+

_ = require 'underscore'
exec = require('child_process').exec

module.exports = class GPIOPin

  supportedModes: [
    "in"
    "out"
    "pwm"
  ]

  supportedPins: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]

  pwmMinimum: 0
  pwmMaximum: 1023

  outMinimum: 0
  outMaximum: 1

  constructor: (@pinNumber, options = {}) ->

    defaults =
      silent: false

    @options = _.defaults options, defaults

    if @pinNumber not of @supportedPins
      return throw new Error "Unsupported pin number: #{ @pinNumber }"

  _execute: (cmd) ->
    # console.log "Executing cmd: #{ cmd }"
    return if process.env.NODE_ENV is "development"

    exec cmd, (err, stdout, stderr) =>
      if err
        console.log "Error excuting command.", err, stdout, stderr

  pwm: (val) ->
    unless val <= @pwmMaximum and val >= @pwmMinimum
      return throw new Error "PWM value is out of range: #{ val }"

    cmd = "gpio mode #{ @pinNumber } pwm"
    @_execute cmd

    cmd = "gpio pwm #{ @pinNumber } #{ val }"
    @_execute cmd

  out: (val) ->
    unless val <= @outMaximum and val >= @outMinimum
      return throw new Error "Output value of '#{ val }' is out of range. Min: #{ @outMinimum }, Max: #{ @outMaximum }"

    cmd = "gpio mode #{ @pinNumber } out"
    @_execute cmd

    cmd = "gpio write #{ @pinNumber } #{ val }"
    @_execute cmd
