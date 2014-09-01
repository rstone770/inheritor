do require('chai').should

fixture = require '../../fixtures/helpers/object'

extend = require "#{process.cwd()}/src/helpers/extend"

describe 'helpers/extend', ->
  object = null

  beforeEach ->
    object = do fixture

  describe 'extend', ->
    it 'should always return the target object.', ->
      extend(object).should.equal.object

    it 'should modify the target.', ->
      extend object,
        color: 'black'

      object.should.have.property 'color', 'black'

    it 'should extend from any number of objects.', ->
      extend object,
        color: 'black'
      ,
        weight: 10

      object.should.have.property 'color', 'black'
      object.should.have.property 'weight', 10
      object.should.have.property 'name', 'mittens'