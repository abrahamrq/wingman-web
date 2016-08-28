$ ->
  window.suggestion = new Suggestion()
  window.pene = []

class @Suggestion
  constructor: ->
    current_location = @navigatorLocation()
    $('#make-suggestion').click ->
      $.ajax
        url: '/suggestion/foursquare'
        type: 'GET'
        data: { location: current_location }
        success: (response) ->
          alert(response.suggestions)
        error: (response) ->

  navigatorLocation: ->
    @algo = []
    navigator.geolocation.getCurrentPosition( (pos) =>
      coords = pos.coords
      @algo = [coords.latitude, coords.longitude]
      debugger
    )
    @algo
