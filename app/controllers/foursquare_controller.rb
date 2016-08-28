class FoursquareController < ApplicationController

  def create_suggestion
    location = '25.6482778,-100.2884632'
    FoursquareSuggestion.new(location)
  end
  
  private
end