$ ->
  window.suggestion = new Suggestion()

class @Suggestion
  constructor: ->
    $('#make-suggestion').click ->
      navigator.geolocation.getCurrentPosition( (pos) =>
        coords = pos.coords
        algo = [coords.latitude, coords.longitude]
        $.ajax
          url: '/suggestion/foursquare'
          type: 'GET'
          data: { location: algo }
          success: (response) ->
            alert(response.suggestions)
          error: (response) ->

      )