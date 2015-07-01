class BaseQuantity

    @MASS: "mass"
    @TIME: "time"
    @LENGTH: "length"

    _instance = null
    _list = null

    @instance:() ->
          @_instance ?= new @(arguments...)

    constructor:()->
        @_build()

    _build:()->
        @_list = []
        @_list["m"] = new Base(BaseQuantity.LENGTH, Unit.instance().select('m'))
        @_list["s"]  = new Base(BaseQuantity.TIME,       Unit.instance().select('s'))
        @_list["g"] = new Base(BaseQuantity.MASS,      Unit.instance().select('g'))

    select:(p_name)->
        p = @_list[p_unitSymbol]
        return if p isnt null and p isnt undefined then p else throw new Error("Unit::prefix Error: There is no unit called '#{p_unitSymbol}'.")

    selectAll:()->
        return @_list

    isBase:(p_unit)->
        return if @_list[p_unit] then @_list[p_unit] else false

    #
    ## Base
    #

    class Base

        _quantity:null
        _unit:null

        constructor : (p_quantity, p_unit) ->
            @_quantity = p_quantity
            @_unit = p_unit

        quantity:()->
            return @_quantity

        unit:()->
            return @_unit
