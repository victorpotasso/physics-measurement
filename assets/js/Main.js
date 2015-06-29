(function() {
  var BaseQuantity, Main, Measurement, SIUnitPrefix, Unit;

  Unit = (function() {
    Unit.prototype._value = null;

    Unit.prototype._name = null;

    Unit.prototype._symbol = null;

    Unit.prototype._baseQuantity = null;

    function Unit(p_value, p_name, p_symbol, p_baseQuantity) {
      this._value = p_value;
      this._name = p_name;
      this._symbol = p_symbol;
      this._baseQuantity = p_baseQuantity;
    }

    Unit.prototype.value = function() {
      return this._value;
    };

    Unit.prototype.name = function() {
      return this._name;
    };

    Unit.prototype.symbol = function() {
      return this._symbol;
    };

    Unit.prototype.baseQuantity = function() {
      return this._baseQuantity;
    };

    return Unit;

  })();

  SIUnitPrefix = (function() {
    SIUnitPrefix.prototype._factor = null;

    SIUnitPrefix.prototype._prefix = null;

    SIUnitPrefix.prototype._symbol = null;

    function SIUnitPrefix(p_factor, p_prefix, p_symbol) {
      this._factor = p_factor;
      this._prefix = p_prefix;
      this._symbol = p_symbol;
    }

    SIUnitPrefix.prototype.factor = function() {
      return this._factor;
    };

    SIUnitPrefix.prototype.prefix = function() {
      return this._prefix;
    };

    SIUnitPrefix.prototype.symbol = function() {
      return this._symbol;
    };

    return SIUnitPrefix;

  })();

  BaseQuantity = (function() {
    BaseQuantity.MASS = "mass";

    BaseQuantity.TIME = "time";

    BaseQuantity.LENGTH = "length";

    BaseQuantity.prototype._quantity = null;

    BaseQuantity.prototype._unit = null;

    function BaseQuantity(p_quantity, p_unit) {
      this._quantity = p_quantity;
      this._unit = p_unit;
    }

    BaseQuantity.prototype.quantity = function() {
      return this._quantity;
    };

    BaseQuantity.prototype.unit = function() {
      return this._unit;
    };

    BaseQuantity.prototype.isEqual = function(p_baseQuantity) {
      return p_baseQuantity.quantity() === this._baseQuantity && p_baseQuantity.unit() === this._unit;
    };

    return BaseQuantity;

  })();

  Measurement = (function() {
    Measurement.prototype._baseQuantities = null;

    Measurement.prototype._units = null;

    Measurement.prototype._siUnitsPrefixes = null;

    function Measurement() {
      this._siUnitsPrefixes = [];
      this._siUnitsPrefixes["yotta"] = new SIUnitPrefix(1e+24, "yotta", "Y");
      this._siUnitsPrefixes["zetta"] = new SIUnitPrefix(1e+21, "zetta", "Z");
      this._siUnitsPrefixes["exa"] = new SIUnitPrefix(1e+18, "exa", "E");
      this._siUnitsPrefixes["petta"] = new SIUnitPrefix(1e+15, "petta", "P");
      this._siUnitsPrefixes["giga"] = new SIUnitPrefix(1e+9, "giga", "G");
      this._siUnitsPrefixes["mega"] = new SIUnitPrefix(1e+6, "mega", "M");
      this._siUnitsPrefixes["kilo"] = new SIUnitPrefix(1e+3, "kilo", "k");
      this._siUnitsPrefixes["hecto"] = new SIUnitPrefix(1e+2, "hecto", "h");
      this._siUnitsPrefixes["deka"] = new SIUnitPrefix(1e+1, "deka", "d");
      this._siUnitsPrefixes["deci"] = new SIUnitPrefix(1e-1, "deci", "c");
      this._siUnitsPrefixes["mili"] = new SIUnitPrefix(1e-3, "mili", "m");
      this._siUnitsPrefixes["micro"] = new SIUnitPrefix(1e-6, "micro", "µ");
      this._siUnitsPrefixes["nano"] = new SIUnitPrefix(1e-9, "nano", "n");
      this._siUnitsPrefixes["pico"] = new SIUnitPrefix(1e-12, "pico", "p");
      this._siUnitsPrefixes["femto"] = new SIUnitPrefix(1e-15, "femto", "f");
      this._siUnitsPrefixes["atto"] = new SIUnitPrefix(1e-18, "atto", "a");
      this._siUnitsPrefixes["zepto"] = new SIUnitPrefix(1e-21, "zepto", "z");
      this._siUnitsPrefixes["yocto"] = new SIUnitPrefix(1e-24, "yocto", "y");
      this._units = [];
      this._units['m'] = new Unit(1, "meter", "m", BaseQuantity.LENGTH);
      this._units['s'] = new Unit(1, "second", "s", BaseQuantity.TIME);
      this._units['g'] = new Unit(1, "gram", "g", BaseQuantity.MASS);
      this._units['min'] = new Unit(60, "minute", "min", BaseQuantity.TIME);
      this._units['hour'] = new Unit(3600, "hour", "hour", BaseQuantity.TIME);
      this._units['km'] = new Unit(this._siUnitsPrefixes["kilo"].factor(), "" + (this._siUnitsPrefixes["kilo"].prefix()) + "meter", this._siUnitsPrefixes["kilo"].symbol(), BaseQuantity.LENGTH);
      this._units['nm'] = new Unit(this._siUnitsPrefixes["nano"].factor(), "" + (this._siUnitsPrefixes["nano"].prefix()) + "meter", this._siUnitsPrefixes["nano"].symbol(), BaseQuantity.LENGTH);
      this._units['ft'] = new Unit(0.3048, "foot", "ft", BaseQuantity.LENGTH);
      this._baseQuantities = [];
      this._baseQuantities.push(new BaseQuantity(BaseQuantity.LENGTH, this._units['m']));
      this._baseQuantities.push(new BaseQuantity(BaseQuantity.TIME, this._units['s']));
      this._baseQuantities.push(new BaseQuantity(BaseQuantity.MASS, this._units['g']));
    }

    Measurement.prototype.units = function() {
      return this._units;
    };

    Measurement.prototype.baseQuantities = function() {
      return this._baseQuantities;
    };

    Measurement.prototype.siUnitsPrefixes = function() {
      return this._siUnitsPrefixes;
    };

    Measurement.prototype.convertFromTo = function(p_fromValue, p_fromUnit, p_toUnit) {
      var fu, fv, tu;
      fv = p_fromValue;
      fu = this._units[p_fromUnit];
      tu = this._units[p_toUnit];
      if (fu.baseQuantity() === tu.baseQuantity()) {
        console.log("convert", p_fromValue, p_fromUnit, 'to', p_toUnit);
        return (fv * fu.value()) / tu.value() + " " + p_toUnit;
      } else {
        throw new Error("Measurement::convertFromTo Erro: They are not the same base quantity.");
      }
    };

    Measurement.prototype.checkBaseQuantity = function(p_value) {
      var bq, i;
      i = this._baseQuantities.length;
      while (i--) {
        bq = this._baseQuantities[i];
        if (bq.check(p_value)) {
          return bq;
        }
      }
      return null;
    };

    return Measurement;

  })();

  Main = (function() {
    function Main() {
      var measurement;
      console.log("--- Physics Measurement ---");
      measurement = new Measurement();
      $("#convert-}button").on("click", function() {
        return console.log("button clicked!");
      });
    }

    Main.prototype.convert = function(p_event) {
      return console.log("test", $(this));
    };

    return Main;

  })();

  new Main();

}).call(this);
