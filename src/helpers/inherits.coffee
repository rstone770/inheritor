extend = require './extend'

# simply extends a classes prototype and class variables based This.
module.exports = (parent, prototype = {}, statics = {}) ->
  constructor =
    if Object.hasOwnProperty.call prototype, 'constructor'
      prototype.constructor
    else
      () -> parent.apply @, arguments

  constructor:: = Object.create parent::

  extend constructor, parent, statics,
    __super: parent::

  extend constructor::, prototype

  constructor
