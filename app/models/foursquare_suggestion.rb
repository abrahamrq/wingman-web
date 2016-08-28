class FoursquareSuggestion
  def initialize(location, user = nil)
    binding.pry
    suggestions = foursquare_client.search_venues(ll: '25.6482778,-100.2884632',
                                                  limit: 100)
    foursquare_client.search_venues(ll: '25.6482778,-100.2884632',
                                    limit: 50, radius: 100,
                                    intent: 'browse').venues
  end

  private

  def foursquare_client
    @foursquare_client ||= Foursquare2::Client.new(client_id: ENV['FS_CLIENT_ID'],
                                                   client_secret: ENV['FS_CLIENT_SECRET'],
                                                   api_version: ENV['FS_API_VERSION'])
  end
end