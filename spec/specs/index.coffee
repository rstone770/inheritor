require('chai').should()

fixutre  = require "#{process.cwd()}/spec/fixtures/helpers/klass"
index    = require "#{process.cwd()}/src/index"
extend   = require "#{process.cwd()}/src/helpers/extend"
inherits = require "#{process.cwd()}/src/helpers/inherits"

describe 'index', ->

  describe 'version', ->
    it 'should contain a mustache compatible version string.', ->
      index.should.have.property 'version', '{{version}}'

  describe 'extend', ->
    it 'should extend from this.', ->
      Klass = fixutre 'bare'

      Klass.extend = index.extend

      Prototype =
        method: () ->

      Expected = inherits Klass, Prototype

      Result = Klass.extend Prototype

      Expected::should.deep.equal Result::

  describe 'from', ->
    it 'should export inherits.', ->
      index.should.have.property 'from', inherits

  describe 'mixin', ->
    it 'should export extend.', ->
      index.should.have.property 'mixin', extend

