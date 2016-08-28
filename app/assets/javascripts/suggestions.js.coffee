class @Suggestion
  constructor: ->
    $('#make-suggestion').click ->
      navigator.geolocation.getCurrentPosition( (pos) =>
        coords = pos.coords
        algo = [coords.latitude, coords.longitude]
        $.ajax
          url: '/suggestion/foursquare'
          type: 'GET'
          data: { location: algo, radius: 10000 }
          success: (response) ->
          error: (response) ->
      )