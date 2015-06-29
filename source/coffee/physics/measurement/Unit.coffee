class Unit

    _value:null
    _name:null
    _symbol:null
    _baseQuantity:null

    constructor : (p_value, p_name, p_symbol, p_baseQuantity) ->
        @_value = p_value
        @_name = p_name
        @_symbol = p_symbol
        @_baseQuantity = p_baseQuantity

    value:()->
        return @_value

    name:()->
        return @_name

    symbol:()->
        return @_symbol

    baseQuantity:()->
        return @_baseQuantity
