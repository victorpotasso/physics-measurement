#import physics.measurement.Unit

class Quantity

    _quantity:null
    _unit:null
    _base:null

    constructor:(p_quantity, p_unit)->
        if !isNaN(parseFloat(p_quantity)) && isFinite(p_quantity) then @_quantity = p_quantity else throw new Error("Quantity::constructor Error: '#{p_quantity} is not a Number.'")
        if Unit.instance().isValid(p_unit) then @_unit = p_unit else throw new Error("Quantity::constructor Error: '#{p_unit} is not a valid unit.'")

    quantity:()->
        return @_quantity

    unit:()->
        return @_unit

    # conversions

    to:(p_unit)->

        fu = Unit.instance().select(@_unit)
        tu = Unit.instance().select(p_unit)

        if fu isnt null and tu isnt null
            if fu.base() is  tu.base()
                return (@_quantity * fu.quantity()) / tu.quantity() + " #{p_unit}"
            else
                throw new Error "Quantity::to Erro: They are not the same base quantity."
        throw new Error "Quantity::to Erro: There is a null unit."
