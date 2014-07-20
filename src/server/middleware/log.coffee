module.exports = (req, res, next) ->
  console.log "---> #{ req.method } #{ req.path }"
  res.on "finish", ->
    console.log "<--- #{ res.statusCode } #{ req.path }"

  next()
