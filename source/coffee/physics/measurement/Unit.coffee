#import physics.measurement.BaseQuantity
#import physics.measurement.SIUnitPrefix

class Unit

    _instance = null
    _list = null

    @instance:() ->
          @_instance ?= new @(arguments...)

    constructor:()->
        @_build()

    _build:()->
        @_list = []

        # base quantity units
        @_list['m'] = new Base(1, "meter", "m", BaseQuantity.LENGTH)
        @_list['s']  = new Base(1, "second", "s", BaseQuantity.TIME)
        @_list['g']  = new Base(1, "gram", "g", BaseQuantity.MASS)

        #
        # LENGTH
        #

        # non SI units
        @_list['ft'] = new Base(0.3048, "foot", "ft", BaseQuantity.LENGTH)
        @_list['yd'] = new Base(0.9144, "yard", "yd", BaseQuantity.LENGTH)
        @_list['in'] = new Base(0.0254, "inch", "in", BaseQuantity.LENGTH)
        @_list['ua'] = new Base(149597870700, "astronomical unit", "ua", BaseQuantity.LENGTH)

        # SI
        for k,v of SIUnitPrefix.instance().selectAll()
            @_list["#{v.symbol()}m"]  = new Base(v.factor(), "#{v.prefix()}meter",  "#{v.symbol()}m", BaseQuantity.LENGTH)

        #
        # MASS
        #

        # non SI units
        @_list['lb'] = new Base(453.59237, "pound", "lb", BaseQuantity.MASS)
        @_list['oz'] = new Base(28.3495231, "ounces", "oz", BaseQuantity.MASS)
        @_list['u'] = new Base(6.02214129 * 1e+23, "atomic mass", "u", BaseQuantity.MASS)

        # SI
        for k,v of SIUnitPrefix.instance().selectAll()
            @_list["#{v.symbol()}g"]  = new Base(v.factor(), "#{v.prefix()}gram",  "#{v.symbol()}g", BaseQuantity.MASS)

        #
        # TIME
        #

        # non SI units
        @_list['d']    = new Base(86400, "day", "d", BaseQuantity.TIME)
        @_list['min']    = new Base(60, "minute", "min", BaseQuantity.TIME)
        @_list['h']  = new Base(3600, "hour", "h", BaseQuantity.TIME)

        # SI
        for k,v of SIUnitPrefix.instance().selectAll()
            @_list["#{v.symbol()}s"]  = new Base(v.factor(), "#{v.prefix()}second",  "#{v.symbol()}s", BaseQuantity.TIME)

    select:(p_unitSymbol)->
        p = @_list[p_unitSymbol]
        return if p isnt null and p isnt undefined then p else throw new Error("Unit::prefix Error: There is no unit called '#{p_unitSymbol}'.")

    selectAll:()->
        return @_list

    selectAllByBaseQuantity:(p_baseQuantity)->
        a = []
        for k,v of @_list
            if v.base() is p_baseQuantity then a[k] = v
        return a

    isValid:(p_unit)->
        return if @_list[p_unit] then true else false

    #
    # Base
    #

    class Base

        _quantity:null
        _name:null
        _symbol:null
        _base:null

        constructor : ( p_quantity, p_name, p_symbol, p_base) ->
            @_quantity = p_quantity
            @_name = p_name
            @_symbol = p_symbol
            @_base = p_base

        quantity:()->
            return @_quantity

        name:()->
            return @_name

        symbol:()->
            return @_symbol

        # base quantity
        base:()->
            return @_base
