inherits = require './helpers/inherits'

api =

  version: '{{version}}'

  extend: (prototype = {}, statics = {}) ->
    api.from @, prototype, statics

  from: inherits

module.exports = api