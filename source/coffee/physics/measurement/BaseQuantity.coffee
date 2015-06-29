class BaseQuantity

    @MASS: "mass"
    @TIME: "time"
    @LENGTH: "length"

    _quantity:null
    _unit:null

    constructor : (p_quantity, p_unit) ->
        @_quantity = p_quantity
        @_unit = p_unit

    quantity:()->
        return @_quantity

    unit:()->
        return @_unit

    isEqual:(p_baseQuantity)->
        return p_baseQuantity.quantity() is @_baseQuantity and p_baseQuantity.unit() is @_unit
