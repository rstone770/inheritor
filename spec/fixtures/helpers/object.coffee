
fixture =
  name: 'mittens'
  age: 7

module.exports = (props) ->
  if props
    return props
  else
    return fixture