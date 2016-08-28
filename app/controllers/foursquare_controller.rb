class FoursquareController < ApplicationController
  def create_suggestion
    radius = params[:radius]
    location = params[:location]
    @suggestions = FoursquareSuggestion.get_venues(location, radius, rand(2..3), current_user)
  end
  
  private
end