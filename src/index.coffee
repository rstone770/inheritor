inherits = require './helpers/inherits'
extend = require './helpers/extend'

api =

  version: '{{version}}'

  extend: (prototype = {}, statics = {}) ->
    api.from @, prototype, statics

  from: inherits

  mixin: extend

module.exports = api