path = require "path"
express = require "express"
nconf = require "nconf"

root = path.join __dirname, "..", "..", ".."

module.exports = router = express.Router()

router.get '/bower/:module/:file', (req, res) ->
  res.set "content-type", "text/javascript"
  res.sendfile path.join root, "bower_components", req.params.module, req.params.file

router.get '/bower/bootstrap.js', (req, res) ->
  res.set "content-type", "text/javascript"
  res.sendfile path.join root, "bower_components", "bootstrap", "dist", "js", "bootstrap.js"

router.get /^\/vendor/, (req, res)->
  res.sendfile path.join root, req.path

router.get '/page.css', (req, res)->
  res.set "content-type", "text/css"
  res.sendfile path.join root, "build", "page.css"

router.get '/fonts/:font', (req, res)->
  res.sendfile path.join root, "bower_components", "bootstrap", "fonts", req.params.font

router.get '/bundle.js', (req, res) ->
  res.set "content-type", "text/javascript"
  res.sendfile path.join root, "build", "bundle.js"

router.get '/templates.js', (req, res) ->
  res.set "content-type", "text/javascript"
  res.sendfile path.join root, "build", "templates.js"
