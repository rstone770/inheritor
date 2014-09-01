# Inherits [![Build Status](https://travis-ci.org/rstone770/inherits.svg?branch=master)](https://travis-ci.org/rstone770/inherits)
====

Plain and simple, Inherits is an inheritance library that emulates the inheritance pattern of backbone extend. This library functions 

# Install
npm install inheritor

# Usage
Inherits uses the UMD format so there are many ways of including the libary in your projects.

Global
```html
<script src="lib/bin/inherits.min.js"></script>
<script>
	alert(inherits.version);
</script>
```

RequireJS
```javascript
define([
	'inherits'
], function(inherits) {
	alert(inerits.version);
});

```

Node / CommonJS
```javascript
inherits = require('inherits');
```

After the library has been loaded, usage is pretty straight forward.

```javascript
Emitter = require('events').EventEmmitter

MyEmitter = inherits.from(Emitter, {
	someMethod: function() {
		console.log('MyEmitter Says Hi!');
	}	
});

MyEmitter.extend = inherits.extend;

SubClassMyEmitter = MyEmitter.extend({
	someMethod: function() {
		console.log('SubClassMyEmitter Says Hi!');

		SubClassMyEmitter.__super.someMethod.call(this);
	}
});

```
There are a couple things to note. 
- **from** and **extend** are the same method. From takes a source as context and extends from the other provided parameters. extend uses this as its source and uses the other paramters to extend from. Adding the extend method to the MyEmitter constructor gave this context to MyEmitter.
- **__super** is added to each extended constructor which directly points to the parents prototype.

# Methods
## from(source, [prototype [, static]])
This method will extend a source object by copying its prototype and merging it with the provided prototype. static items are added directly to the constructor and are also copied from the source and merged with the provided statics. Properties that exist in source are overwriten by properties provided.

```javascript
Person = function(name) {
	this.name = name;
}

Person.prototype = {
	getName: function() {
		return this.name; 
	}
};

Employee = inherits.from(Person, {
	work: function() {
		console.log(this.getName() + ' is doing work.');
	}
}, {
	create: function() {
		var instance = Object.create(this.prototype);

		instance.constructor.apply(instance, arguments);

		return instance
	}
});

Bob = Employee.create('bob').work(); // bob is doing work.
```

## extend([prototype [, static]])
Exactly the same as **from** except that the source is this. This allows you to assign the method to objects and have it work directly off them instead of having to constantly use a source.

```javascript
Person = function(name) {
	this.name = name;
}

Person.extend = inherits.extend;

Person.prototype = {
	getName: function() {
		return this.name; 
	}
};

Employee = Person.extend({
	work: function() {
		console.log(this.getName() + ' is doing work.');
	}
}, {
	create: function() {
		var instance = Object.create(this.prototype);

		instance.constructor.apply(instance, arguments);

		return instance
	}
});

EmployeeSubClass = Employee.extend({
	// more stuff
});

Bob = EmployeeSubClass.create('bob').work(); // bob is doing work.
```

# Building
To build the project checkout out the repository and simply use npm install and gulp.
```
npm install
gulp
```