class FoursquareController < ApplicationController

  def create_suggestion
    location = '25.6482778,-100.2884632'
    suggestions = FoursquareSuggestion.get_venues(location, 10000, 3)
    binding.pry
  end
  
  private
end