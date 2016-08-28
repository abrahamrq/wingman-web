class FoursquareController < ApplicationController

  def create_suggestion
    radius = params[:radius]
    location = params[:location]
    suggestions = FoursquareSuggestion.get_venues(location, radius, rand(2..3), current_user)
    render json: { suggestions: suggestions }, status: 200
  end
  
  private
end