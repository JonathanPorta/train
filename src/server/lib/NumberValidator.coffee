class NumberValidator

  isNumber: (value) ->
    !isNaN(parseFloat(value)) && isFinite(value)

  isWithinRange: (minimum, maximum, value) ->
    if @isNumber(minimum) isnt true or @isNumber(maximum) isnt true
      throw new Error "WTF, the specified minimum or maximum isn't even a number!"

    if @isNumber(value) isnt true
      false
    else if value > maximum
      false
    else if value < minimum
      false
    else
      true

  defaultTo: (minimum, maximum, value, defaultValue) ->
    if @isWithinRange(minimum, maximum, parseInt(value)) isnt true
      defaultValue
    else
      parseInt(value)

module.exports = new NumberValidator
