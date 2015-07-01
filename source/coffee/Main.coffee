#import physics.measurement.Unit
#import physics.measurement.Quantity

class Main

    measurement = null

    constructor:()->
        console.log "--- Physics Measurement by Victor Potasso ---"
        @_build()

    _build:()->

        console.log Unit.instance().selectAllByBaseQuantity("length")

        # fill select inputs
        toUnits = $('#toUnits')
        fromUnits = $('#fromUnits')
        for k,v of Unit.instance().selectAll()
            toUnits.append("<option value='#{k}'>#{k} - #{v.name()}</option>")
            fromUnits.append("<option value='#{k}'>#{k} - #{v.name()}</option>")

        # submit action
        $("#conversion-form").submit(@submit)

    submit:(p_event)->
        p_event.preventDefault()

        data = {}
        $(this).find('input, textarea, select').each (i, field) ->
            data[field.name] = field.value

        q = new Quantity(data.fromValue, data.fromUnit)
        result = q.to(data.toUnit)

        $('#result').text("Result: #{data.fromValue} #{data.fromUnit} is equal to #{result}")

new Main()
