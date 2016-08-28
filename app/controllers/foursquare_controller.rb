class FoursquareController < ApplicationController

  def create_suggestion
    binding.pry
    location = '25.6482778,-100.2884632'
    suggestions = FoursquareSuggestion.get_venues(location, 10000, rand(1..3), current_user)
    render json: { suggestions: suggestions }, status: 200
  end
  
  private
end