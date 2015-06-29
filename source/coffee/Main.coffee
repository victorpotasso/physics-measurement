#import physics.measurement.Measurement

class Main

    constructor:()->
        console.log "--- Physics Measurement ---"

        measurement = new Measurement()
        # console.log 'Conversion result', measurement.convertFromTo( 3, "ft",  "m")
        # console.log 'Conversion result', measurement.convertFromTo( 65, "min",  "s")
        # console.log 'Conversion result', measurement.convertFromTo( 5, "km",  "m")
        # console.log 'Conversion result', measurement.convertFromTo( 980, "m",  "km")
        # console.log 'Conversion result', measurement.convertFromTo( 2, "km",  "nm")
        # console.log 'Conversion result', measurement.convertFromTo( 15000, "nm",  "km")

        $("button").click(@convert)

    convert:(p_event)->
        console.log "FORM", p_event
        p_event.preventDefault()

new Main()
