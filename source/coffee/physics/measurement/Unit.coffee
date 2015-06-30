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

        # time
        @_list['min']    = new Base(60, "minute", "min", BaseQuantity.TIME)
        @_list['hour']  = new Base(3600, "hour", "hour", BaseQuantity.TIME)

        # length
        for k1,v1 of SIUnitPrefix.instance().selectAll()
            @_list["#{v1.symbol()}m"]  = new Base(v1.factor(), "#{v1.prefix()}meter",  "#{v1.symbol()}m", BaseQuantity.LENGTH)

        # mass
        for k2,v2 of SIUnitPrefix.instance().selectAll()
            @_list["#{v2.symbol()}g"]  = new Base(v2.factor(), "#{v2.prefix()}gram",  "#{v2.symbol()}g", BaseQuantity.MASS)

        # english units
        @_list['ft'] = new Base(0.3048, "foot", "ft", BaseQuantity.LENGTH)

    select:(p_name)->
        p = @_list[p_name]
        return if p isnt null and p isnt undefined then p else throw new Error("Unit::prefix Error: There is no unit called '#{p_name}'.")

    selectAll:()->
        return @_list

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
