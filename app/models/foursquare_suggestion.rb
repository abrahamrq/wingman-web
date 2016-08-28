class FoursquareSuggestion
  def self.get_venues(location, radius, limit, user = nil)
    categories = set_categories(user)
    location_string = "#{location[0]},#{location[1]}"
    suggestions = foursquare_search(location_string, radius, categories)
    suggestions = filter_suggestion(suggestions, limit)
    ordered_suggestions = parse_suggestions(suggestions).sort_by { |sug| sug[:distance] }
    # UberTrip.new.estimations(ordered_suggestions, location)
  end

  private

  def self.set_categories(user)
    return user.interests.pluck(:fs_key).join(',') if user.interests.any?
    Interest.all.pluck(:fs_key).join(',')
  end

  def self.filter_suggestion(suggestions, limit)
    categories = ["Department Store", "Supermarket", "Bank"]
    filtered_suggestions = []
    suggestions.shuffle.each do |suggestion|
      category = parse_categories(suggestion)
      if suggestion["stats"]["usersCount"] < 15 || categories.include?(category)
        next
      end
      categories << category
      filtered_suggestions << suggestion
      break if filtered_suggestions.size >= limit
    end
    filtered_suggestions
  end

  def self.parse_suggestions(suggestions)
    suggestions.map do |v|
      icon = v["categories"].first["icon"]
      icon_url = "#{icon['prefix']}88#{icon['suffix']}"
      { name: v["name"], address: v["location"]["address"], lat: v["location"]["lat"],
        lon: v["location"]["lng"], distance: v["location"]["distance"],
        categories: parse_categories(v), counts: v["stats"]["usersCount"],
        icon: icon_url}
    end
  end

  def self.parse_categories(suggestion)
    suggestion["categories"].map {|c| c["name"]}.join(',')
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