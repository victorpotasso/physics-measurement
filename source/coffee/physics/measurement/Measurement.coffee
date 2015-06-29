#import physics.measurement.BaseQuantity
#import physics.measurement.SIUnitPrefix
#import physics.measurement.Unit

class Measurement

    _baseQuantities:null
    _units:null
    _siUnitsPrefixes:null

    constructor:()->

        # Prefixes for SI Units
        @_siUnitsPrefixes = []
        @_siUnitsPrefixes["yotta"] =  new SIUnitPrefix(1e+24, "yotta", "Y")
        @_siUnitsPrefixes["zetta"] =  new SIUnitPrefix(1e+21, "zetta", "Z")
        @_siUnitsPrefixes["exa"] =  new SIUnitPrefix(1e+18, "exa", "E")
        @_siUnitsPrefixes["petta"] =  new SIUnitPrefix(1e+15, "petta", "P")
        @_siUnitsPrefixes["giga"] =  new SIUnitPrefix(1e+9, "giga", "G")
        @_siUnitsPrefixes["mega"] =  new SIUnitPrefix(1e+6, "mega", "M")
        @_siUnitsPrefixes["kilo"] =  new SIUnitPrefix(1e+3, "kilo", "k")
        @_siUnitsPrefixes["hecto"] =  new SIUnitPrefix(1e+2, "hecto", "h")
        @_siUnitsPrefixes["deka"] =  new SIUnitPrefix(1e+1, "deka", "d")
        @_siUnitsPrefixes["deci"] =  new SIUnitPrefix(1e-1, "deci", "c")
        @_siUnitsPrefixes["mili"] =  new SIUnitPrefix(1e-3, "mili", "m")
        @_siUnitsPrefixes["micro"] =  new SIUnitPrefix(1e-6, "micro", "µ")
        @_siUnitsPrefixes["nano"] =  new SIUnitPrefix(1e-9, "nano", "n")
        @_siUnitsPrefixes["pico"] =  new SIUnitPrefix(1e-12, "pico", "p")
        @_siUnitsPrefixes["femto"] =  new SIUnitPrefix(1e-15, "femto", "f")
        @_siUnitsPrefixes["atto"] =  new SIUnitPrefix(1e-18, "atto", "a")
        @_siUnitsPrefixes["zepto"] =  new SIUnitPrefix(1e-21, "zepto", "z")
        @_siUnitsPrefixes["yocto"] =  new SIUnitPrefix(1e-24, "yocto", "y")

        # Units #######################################################
        @_units = []

        # base units
        @_units['m'] = new Unit(1, "meter", "m", BaseQuantity.LENGTH)
        @_units['s']  = new Unit(1, "second", "s", BaseQuantity.TIME)
        @_units['g']  = new Unit(1, "gram", "g", BaseQuantity.MASS)

        # time
        @_units['min']    = new Unit(60, "minute", "min", BaseQuantity.TIME)
        @_units['hour']  = new Unit(3600, "hour", "hour", BaseQuantity.TIME)

        # length
        @_units['km']  = new Unit(@_siUnitsPrefixes["kilo"].factor(), "#{@_siUnitsPrefixes["kilo"].prefix()}meter", @_siUnitsPrefixes["kilo"].symbol(), BaseQuantity.LENGTH)
        @_units['nm']  = new Unit(@_siUnitsPrefixes["nano"].factor(), "#{@_siUnitsPrefixes["nano"].prefix()}meter", @_siUnitsPrefixes["nano"].symbol(), BaseQuantity.LENGTH)

        # english units
        @_units['ft'] = new Unit(0.3048, "foot", "ft", BaseQuantity.LENGTH)

        ###### #######################################################

        # Base quantities
        @_baseQuantities = []
        @_baseQuantities.push( new BaseQuantity(BaseQuantity.LENGTH, @_units['m']) )
        @_baseQuantities.push( new BaseQuantity(BaseQuantity.TIME,      @_units['s']) )
        @_baseQuantities.push( new BaseQuantity(BaseQuantity.MASS,     @_units['g']) )

    units:()->
        return @_units

    baseQuantities:()->
        return @_baseQuantities

    siUnitsPrefixes:()->
        return @_siUnitsPrefixes

    # conversions
    convertFromTo:(p_fromValue, p_fromUnit, p_toUnit)->
        fv = p_fromValue
        fu = @_units[p_fromUnit]
        tu = @_units[p_toUnit]

        if fu.baseQuantity() is  tu.baseQuantity()
            console.log "convert", p_fromValue, p_fromUnit, 'to', p_toUnit
            return (fv * fu.value()) / tu.value() + " " + p_toUnit
        else
            throw new Error "Measurement::convertFromTo Erro: They are not the same base quantity."

    # utils

    checkBaseQuantity:(p_value)->
        i =  @_baseQuantities.length
        while  i--
            bq = @_baseQuantities[i]
            if  bq.check(p_value) then return bq
        return null
