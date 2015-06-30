class SIUnitPrefix

    _instance = null
    _list = null

    @instance:() ->
          @_instance ?= new @(arguments...)

    constructor:()->
        @_build()

    _build:()->
        @_list = []
        @_list["yotta"] =  new Base(1e+24, "yotta", "Y")
        @_list["zetta"] =  new Base(1e+21, "zetta", "Z")
        @_list["exa"] =  new Base(1e+18, "exa", "E")
        @_list["petta"] =  new Base(1e+15, "petta", "P")
        @_list["giga"] =  new Base(1e+9, "giga", "G")
        @_list["mega"] =  new Base(1e+6, "mega", "M")
        @_list["kilo"] =  new Base(1e+3, "kilo", "k")
        @_list["hecto"] =  new Base(1e+2, "hecto", "h")
        @_list["deka"] =  new Base(1e+1, "deka", "d")
        @_list["deci"] =  new Base(1e-1, "deci", "c")
        @_list["mili"] =  new Base(1e-3, "mili", "m")
        @_list["micro"] =  new Base(1e-6, "micro", "µ")
        @_list["nano"] =  new Base(1e-9, "nano", "n")
        @_list["pico"] =  new Base(1e-12, "pico", "p")
        @_list["femto"] =  new Base(1e-15, "femto", "f")
        @_list["atto"] =  new Base(1e-18, "atto", "a")
        @_list["zepto"] =  new Base(1e-21, "zepto", "z")
        @_list["yocto"] =  new Base(1e-24, "yocto", "y")

    select:(p_name)->
        p = @_list[p_name]
        return if p isnt null and p isnt undefined then p else throw new Error("SIUnitPrefix::prefix Error: There is no prefix called '#{p_name}'.")

    selectAll:()->
        return @_list

    class Base

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
