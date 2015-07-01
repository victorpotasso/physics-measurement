Physics Measurement
==================

*This library will support you to measure the quantities involved in physics. Among these quantities are length, time, mass, temperature, pressure, and electric current.*

**Github:**

https://github.com/victorpotasso/physics-measurement

**Email:**

[victorpotasso@gmail.com](mailto:victorpotasso@gmail.com)

**Dependences:**

*grunt-coffee-import*

https://www.npmjs.com/package/grunt-coffee-import
https://github.com/victorpotasso/grunt-coffee-import

*jQuery*
https://jquery.com/

Sample
---------

**Creating a quantity**
```js
var q = new Quantity(666, "km");
```

**Convertion a quantity unit to another**
```js
q.to("m");
```

**Select unit**
```js
Unit.instance().select("kg");
```

**Select All units**
```js
Unit.instance().selectAll();
```

**Select All units of a specific base quantity**
```js
Unit.instance().selectAllByBaseQuantity("length");
```

Quantity
----------

**Property**

_quantity : Number Unit's quantity

_unit : String `Unit` class that represents this Quantity

**Functions**

quantity() : Number - returns @_quantity
unit() : Number - returns @_unit
to(p_unit) : String - return the conversion of the unit of this `quantity`.

Unit
------
*`Unit` is a Singleton class.*

**Property**

_quantity : Number Unit's quantity

_unit : String `Unit` class that represents this Quantity

**Functions**

select(p_unitSymbol) : Unit Object - returns an `Unit` object by symbol.
selectAll() : Array - returns a list of all `Unit` objects.
selectAllByBaseQuantity(p_baseQuantity) : Array - returns a list of `Unit` object of  a specif `Base Quantity`.
isValid() : Boolean - check if this Unit is valid.

SIUnitPrefix
--------------
*Prefixes for SI Units. It's a Singleton Class*

**Functions**

select(p_unitPrefix) : SIUnitPrefix Object - returns an `SIUnitPrefix` object by prefix.
selectAll() : Array - returns a list of all `SIUnitPrefix` objects.

BaseQuantity
----------------

**Variables**

MASS: "mass"

TIME: "time"

LENGTH: "length"

**Functions**

select(p_unitSymbol) : Unit Object - returns an `BaseQuantity` object by unit's symbol.
selectAll() : Array - returns a list of all `BaseQuantity` objects.

License
-------

[MIT ](https://github.com/victorpotasso/grunt-as3/blob/master/LICENSE-MIT)© [Victor Potasso](mailto:victorpotasso@gmail.com)
