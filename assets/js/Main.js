(function() {
  var BaseQuantity, Main, Quantity, SIUnitPrefix, Unit;

  SIUnitPrefix = (function() {
    var Base, _instance, _list;

    _instance = null;

    _list = null;

    SIUnitPrefix.instance = function() {
      return this._instance != null ? this._instance : this._instance = (function(func, args, ctor) {
        ctor.prototype = func.prototype;
        var child = new ctor, result = func.apply(child, args);
        return Object(result) === result ? result : child;
      })(this, arguments, function(){});
    };

    function SIUnitPrefix() {
      this._build();
    }

    SIUnitPrefix.prototype._build = function() {
      this._list = [];
      this._list["yotta"] = new Base(1e+24, "yotta", "Y");
      this._list["zetta"] = new Base(1e+21, "zetta", "Z");
      this._list["exa"] = new Base(1e+18, "exa", "E");
      this._list["petta"] = new Base(1e+15, "petta", "P");
      this._list["giga"] = new Base(1e+9, "giga", "G");
      this._list["mega"] = new Base(1e+6, "mega", "M");
      this._list["kilo"] = new Base(1e+3, "kilo", "k");
      this._list["hecto"] = new Base(1e+2, "hecto", "h");
      this._list["deka"] = new Base(1e+1, "deka", "d");
      this._list["deci"] = new Base(1e-1, "deci", "c");
      this._list["mili"] = new Base(1e-3, "mili", "m");
      this._list["micro"] = new Base(1e-6, "micro", "µ");
      this._list["nano"] = new Base(1e-9, "nano", "n");
      this._list["pico"] = new Base(1e-12, "pico", "p");
      this._list["femto"] = new Base(1e-15, "femto", "f");
      this._list["atto"] = new Base(1e-18, "atto", "a");
      this._list["zepto"] = new Base(1e-21, "zepto", "z");
      return this._list["yocto"] = new Base(1e-24, "yocto", "y");
    };

    SIUnitPrefix.prototype.select = function(p_name) {
      var p;
      p = this._list[p_name];
      if (p !== null && p !== void 0) {
        return p;
      } else {
        throw new Error("SIUnitPrefix::prefix Error: There is no prefix called '" + p_name + "'.");
      }
    };

    SIUnitPrefix.prototype.selectAll = function() {
      return this._list;
    };

    Base = (function() {
      Base.prototype._factor = null;

      Base.prototype._prefix = null;

      Base.prototype._symbol = null;

      function Base(p_factor, p_prefix, p_symbol) {
        this._factor = p_factor;
        this._prefix = p_prefix;
        this._symbol = p_symbol;
      }

      Base.prototype.factor = function() {
        return this._factor;
      };

      Base.prototype.prefix = function() {
        return this._prefix;
      };

      Base.prototype.symbol = function() {
        return this._symbol;
      };

      return Base;

    })();

    return SIUnitPrefix;

  })();

  BaseQuantity = (function() {
    var Base, _instance, _list;

    BaseQuantity.MASS = "mass";

    BaseQuantity.TIME = "time";

    BaseQuantity.LENGTH = "length";

    _instance = null;

    _list = null;

    BaseQuantity.instance = function() {
      return this._instance != null ? this._instance : this._instance = (function(func, args, ctor) {
        ctor.prototype = func.prototype;
        var child = new ctor, result = func.apply(child, args);
        return Object(result) === result ? result : child;
      })(this, arguments, function(){});
    };

    function BaseQuantity() {
      this._build();
    }

    BaseQuantity.prototype._build = function() {
      this._list = [];
      this._list["m"] = new Base(BaseQuantity.LENGTH, Unit.instance().select('m'));
      this._list["s"] = new Base(BaseQuantity.TIME, Unit.instance().select('s'));
      return this._list["g"] = new Base(BaseQuantity.MASS, Unit.instance().select('g'));
    };

    BaseQuantity.prototype.select = function(p_name) {
      var p;
      p = this._list[p_name];
      if (p !== null && p !== void 0) {
        return p;
      } else {
        throw new Error("Unit::prefix Error: There is no unit called '" + p_name + "'.");
      }
    };

    BaseQuantity.prototype.selectAll = function() {
      return this._list;
    };

    BaseQuantity.prototype.isBase = function(p_unit) {
      if (this._list[p_unit]) {
        return this._list[p_unit];
      } else {
        return false;
      }
    };

    Base = (function() {
      Base.prototype._quantity = null;

      Base.prototype._unit = null;

      function Base(p_quantity, p_unit) {
        this._quantity = p_quantity;
        this._unit = p_unit;
      }

      Base.prototype.quantity = function() {
        return this._quantity;
      };

      Base.prototype.unit = function() {
        return this._unit;
      };

      return Base;

    })();

    return BaseQuantity;

  })();

  Unit = (function() {
    var Base, _instance, _list;

    _instance = null;

    _list = null;

    Unit.instance = function() {
      return this._instance != null ? this._instance : this._instance = (function(func, args, ctor) {
        ctor.prototype = func.prototype;
        var child = new ctor, result = func.apply(child, args);
        return Object(result) === result ? result : child;
      })(this, arguments, function(){});
    };

    function Unit() {
      this._build();
    }

    Unit.prototype._build = function() {
      var k1, k2, v1, v2, _ref, _ref1;
      this._list = [];
      this._list['m'] = new Base(1, "meter", "m", BaseQuantity.LENGTH);
      this._list['s'] = new Base(1, "second", "s", BaseQuantity.TIME);
      this._list['g'] = new Base(1, "gram", "g", BaseQuantity.MASS);
      this._list['min'] = new Base(60, "minute", "min", BaseQuantity.TIME);
      this._list['hour'] = new Base(3600, "hour", "hour", BaseQuantity.TIME);
      _ref = SIUnitPrefix.instance().selectAll();
      for (k1 in _ref) {
        v1 = _ref[k1];
        this._list["" + (v1.symbol()) + "m"] = new Base(v1.factor(), "" + (v1.prefix()) + "meter", "" + (v1.symbol()) + "m", BaseQuantity.LENGTH);
      }
      _ref1 = SIUnitPrefix.instance().selectAll();
      for (k2 in _ref1) {
        v2 = _ref1[k2];
        this._list["" + (v2.symbol()) + "g"] = new Base(v2.factor(), "" + (v2.prefix()) + "gram", "" + (v2.symbol()) + "g", BaseQuantity.MASS);
      }
      return this._list['ft'] = new Base(0.3048, "foot", "ft", BaseQuantity.LENGTH);
    };

    Unit.prototype.select = function(p_name) {
      var p;
      p = this._list[p_name];
      if (p !== null && p !== void 0) {
        return p;
      } else {
        throw new Error("Unit::prefix Error: There is no unit called '" + p_name + "'.");
      }
    };

    Unit.prototype.selectAll = function() {
      return this._list;
    };

    Unit.prototype.isValid = function(p_unit) {
      if (this._list[p_unit]) {
        return true;
      } else {
        return false;
      }
    };

    Base = (function() {
      Base.prototype._quantity = null;

      Base.prototype._name = null;

      Base.prototype._symbol = null;

      Base.prototype._base = null;

      function Base(p_quantity, p_name, p_symbol, p_base) {
        this._quantity = p_quantity;
        this._name = p_name;
        this._symbol = p_symbol;
        this._base = p_base;
      }

      Base.prototype.quantity = function() {
        return this._quantity;
      };

      Base.prototype.name = function() {
        return this._name;
      };

      Base.prototype.symbol = function() {
        return this._symbol;
      };

      Base.prototype.base = function() {
        return this._base;
      };

      return Base;

    })();

    return Unit;

  })();

  Quantity = (function() {
    Quantity.prototype._quantity = null;

    Quantity.prototype._unit = null;

    Quantity.prototype._base = null;

    function Quantity(p_quantity, p_unit) {
      if (!isNaN(parseFloat(p_quantity)) && isFinite(p_quantity)) {
        this._quantity = p_quantity;
      } else {
        throw new Error("Quantity::constructor Error: '" + p_quantity + " is not a Number.'");
      }
      if (Unit.instance().isValid(p_unit)) {
        this._unit = p_unit;
      } else {
        throw new Error("Quantity::constructor Error: '" + p_unit + " is not a valid unit.'");
      }
    }

    Quantity.prototype.quantity = function() {
      return this._quantity;
    };

    Quantity.prototype.unit = function() {
      return this._unit;
    };

    Quantity.prototype.to = function(p_unit) {
      var fu, tu;
      console.log("Convert " + this._quantity + " " + this._unit + " to " + p_unit);
      fu = Unit.instance().select(this._unit);
      tu = Unit.instance().select(p_unit);
      if (fu !== null && tu !== null) {
        if (fu.base() === tu.base()) {
          return (this._quantity * fu.quantity()) / tu.quantity() + " " + p_unit;
        } else {
          throw new Error("Quantity::to Erro: They are not the same base quantity.");
        }
      }
      throw new Error("Quantity::to Erro: There is a null unit.");
    };

    return Quantity;

  })();

  Main = (function() {
    var measurement;

    measurement = null;

    function Main() {
      console.log("--- Physics Measurement by Victor Potasso ---");
      this._build();
    }

    Main.prototype._build = function() {
      var fromUnits, k, toUnits, v, _ref;
      toUnits = $('#toUnits');
      fromUnits = $('#fromUnits');
      _ref = Unit.instance().selectAll();
      for (k in _ref) {
        v = _ref[k];
        toUnits.append("<option value='" + k + "'>" + (v.name()) + "</option>");
        fromUnits.append("<option value='" + k + "'>" + (v.name()) + "</option>");
      }
      return $("#conversion-form").submit(this.submit);
    };

    Main.prototype.submit = function(p_event) {
      var data, q, result;
      p_event.preventDefault();
      data = {};
      $(this).find('input, textarea, select').each(function(i, field) {
        return data[field.name] = field.value;
      });
      q = new Quantity(data.fromValue, data.fromUnit);
      result = q.to(data.toUnit);
      return $('#result').text("Result: " + data.fromValue + " " + data.fromUnit + " to " + data.toUnit + " is equal to " + result);
    };

    return Main;

  })();

  new Main();

}).call(this);
