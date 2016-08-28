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

    $(document).on 'click', '#save-suggestion', (e) ->
      places = $("#save-suggestion").attr('places')
      $.ajax
        url: '/dateplan'
        type: 'POST'
        data: { places: places }
        success: (response) ->
          alert("saved!")
        error: (response) ->