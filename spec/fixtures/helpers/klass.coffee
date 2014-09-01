module.exports = (type = 'bare') ->

  switch type
    when 'bare' then () ->

    when 'constructor' then (@name = 'mittens') ->
    
    when 'prototype'
      class Prototype
        baseMethod: () ->

        baseProperty: 'property'

    when 'static'
      class Static
        @staticMethod: () ->

        @staticProperty: 'property'
