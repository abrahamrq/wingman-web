class FoursquareSuggestion
  def self.get_venues(location, radius, limit, user = nil)
    categories = set_categories(user)
    suggestions = foursquare_search(location, radius, categories)
    suggestions = filter_suggestion(suggestions, limit)
    UberTrip.new.estimations(parse_suggestions(suggestions))
  end

  private

  def self.set_categories(user)
    return user.interests.pluck(:fs_key).join(',') if user
    Interest.all.pluck(:fs_key).join(',')
  end

  def self.filter_suggestion(suggestions, limit)
    suggestions.delete_if do |suggestion|
      suggestion["stats"]["usersCount"] < 15
    end.sample(limit)
  end

  def self.parse_suggestions(suggestions)
    suggestions.map do |v|
      { name: v["name"], address: v["location"]["address"], lat: v["location"]["lat"],
        lon: v["location"]["lng"], distance: v["location"]["distance"],
        categories: parse_categories(v), counts: v["stats"]["usersCount"] }
    end
  end

  def self.parse_categories(suggestion)
    suggestion["categories"].map {|c| c["name"]}.join(',')
  end

  def self.foursquare_client
    @foursquare_client ||= Foursquare2::Client.new(client_id: ENV['FS_CLIENT_ID'],
                                                   client_secret: ENV['FS_CLIENT_SECRET'],
                                                   api_version: ENV['FS_API_VERSION'])
  end

  def self.foursquare_search(location, radius, categories)
    url = URI("https://api.foursquare.com/v2/venues/search?"\
      "ll=#{location}&"\
      "radius=#{radius}&"\
      "limit=50&"\
      "client_id=#{ENV['FS_CLIENT_ID']}&"\
      "client_secret=#{ENV['FS_CLIENT_SECRET']}&"\
      "categoryId=#{categories}&"\
      "v=#{ENV['FS_API_VERSION']}")
    response = JSON.parse(Net::HTTP.get(url))
    response["response"]["venues"]
  end
end