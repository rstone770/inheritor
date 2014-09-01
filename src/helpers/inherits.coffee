extend = require './extend'

# simply extends a classes prototype and class variables based This.
module.exports = (parent, prototype = {}, statics = {}) ->
  constructor =
    if Object.hasOwnProperty.call prototype, 'constructor'
      prototype.constructor
    else
      () -> parent.apply @, arguments

  extend constructor, parent, statics,
    __super: parent.prototype

  extend constructor.prototype, parent.prototype, prototype

  constructor
