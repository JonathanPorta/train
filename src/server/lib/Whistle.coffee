_ = require 'underscore'
exec = require('child_process').exec

module.exports = class Whistle

  constructor: (options = {}) ->

    defaults =
      sound: '../whistle.wav'

    @options = _.defaults options, defaults

  _execute: (cmd) ->
    console.log "Executing cmd: #{ cmd }"

    exec cmd, (err, stdout, stderr) =>
      if err
        console.log "Error excuting command.", err, stdout, stderr

  blow: ->
    cmd = " play #{ @options.sound } ; sleep .5 ; play #{ @options.sound } ; sleep 2 ; play #{ @options.sound }"
    @_execute cmd
