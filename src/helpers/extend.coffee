
# copy all instance safe parent properties into target.
# this function will modify the target
extend = (target, parent) ->
  for property, value of parent
    target[property] = value

  target

# will instead iterate through all sources and call extend on each item.
module.exports = (target, sources...) ->
  extend target, source for source in sources

  target
