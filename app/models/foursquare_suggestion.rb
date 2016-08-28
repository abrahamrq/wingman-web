class FoursquareSuggestion
  def self.get_venues(location, radius, limit, user = nil)
    categories = set_categories(user)
    suggestions = foursquare_client.search_venues(ll: location,
                                                  limit: 100,
                                                  radius: radius,
                                                  intent: 'browse')
    suggestions = filter_suggestion(suggestions.venues, limit)
    parse_suggestions(suggestions)
  end

  private

  def self.set_categories(user)
    return user.interests if user 
  end

  def self.filter_suggestion(suggestions, limit)
    suggestions.delete_if do |suggestion|
      suggestion.stats.usersCount < 15
    end.sample(limit)
  end

  def self.parse_suggestions(suggestions)
    suggestions.map do |v|
      { name: v.name, address: v.location.address, lat: v.location.lat,
        lng: v.location.lng, distance: v.location.distance,
        categories: parse_categories(v), counts: v.stats.usersCount }
    end
  end

  def self.parse_categories(suggestion)
    suggestion.categories.map {|c| c.name}.join(', ')
  end

  def self.foursquare_client
    @foursquare_client ||= Foursquare2::Client.new(client_id: ENV['FS_CLIENT_ID'],
                                                   client_secret: ENV['FS_CLIENT_SECRET'],
                                                   api_version: ENV['FS_API_VERSION'])
  end
end