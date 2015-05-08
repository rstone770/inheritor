require('chai').should()

fixture  = require "#{process.cwd()}/spec/fixtures/helpers/klass"
inherits = require "#{process.cwd()}/src/helpers/inherits"

describe 'helpers/inherits', ->
  bare          = null
  withStatics   = null
  withPrototype = null

  beforeEach () ->
    bare          = fixture 'bare'
    withStatics   = fixture 'static'
    withPrototype = fixture 'prototype'

  it 'should always return a constructor.', ->
    inherits(bare).should.be.a.function
    inherits(bare, {}).should.be.a.function
    inherits(bare, {}, {}).should.be.a.function

  it 'should be instance of base.', ->
    Klass = inherits withPrototype,
      method: () ->
    
    klass = new Klass

    klass.should.be.instanceOf withPrototype

  it 'should use the parent constructor if one is not overridden.', ->
    Klass = inherits fixture 'constructor'

    klass = new Klass

    klass.should.have.property 'name', 'mittens'

  it 'should use overridden constructor.', ->
    Klass = inherits bare,
      constructor: (@age = 30) ->

    klass = new Klass

    klass.should.have.property 'age', 30

  it 'should copy everything from parent prototype.', ->
    Klass = inherits withPrototype

    klass = new Klass

    klass.should.have.property 'baseMethod', withPrototype::baseMethod
    klass.should.have.property 'baseProperty', withPrototype::baseProperty

  it 'should extend from provided prototype.', ->
    Klass = inherits withPrototype,
      anotherMethod: () ->

      baseProperty: 'overridden'

    klass = new Klass

    klass.should.have.property 'baseMethod', withPrototype::baseMethod
    klass.should.have.property 'anotherMethod', Klass::anotherMethod
    klass.should.have.property 'baseProperty', Klass::baseProperty

  it 'should copy static properties from parent.', ->
    Klass = inherits withStatics

    Klass.should.have.property 'staticMethod', withStatics.staticMethod
    Klass.should.have.property 'staticProperty', withStatics.staticProperty

  it 'should extend statics from provided statics.', ->
    Klass = inherits withStatics, {},
      anotherMethod: () ->

      staticProperty: 'overridden'

    Klass.should.have.property 'staticMethod', withStatics.staticMethod
    Klass.should.have.property 'anotherMethod', Klass.anotherMethod
    Klass.should.have.property 'staticProperty', Klass.staticProperty

  it 'should expose parent prototype as @__super.', ->
    Klass = inherits withPrototype

    Klass.should.have.property '__super', withPrototype::