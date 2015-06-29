class SIUnitPrefix

    _factor:null
    _prefix:null
    _symbol:null

    constructor : (p_factor, p_prefix, p_symbol) ->
        @_factor = p_factor
        @_prefix = p_prefix
        @_symbol = p_symbol

    factor:()->
        return @_factor

    prefix:()->
        return @_prefix

    symbol:()->
        return @_symbol
