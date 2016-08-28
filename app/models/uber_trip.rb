class UberTrip
  def initialize
    @uber_client = uber_client
  end

  def estimations(points, location)
    points.each_with_index do |point, index|
      if index < 1
        origin = {lat: location[0], lon: location[1]}
      else
        origin = points[index - 1]
      end
      res = @uber_client.price_estimations(start_latitude: origin[:lat],
                                           start_longitude: origin[:lon],
                                           end_latitude: point[:lat],
                                           end_longitude: point[:lon])

      points[index][:uber_x] = { estimate: res[0][:estimate],
                                 distance: res[0][:distance],
                                 duration: res[0][:duration] }
      points[index][:uber_b] = { estimate: res[3][:estimate],
                                 distance: res[3][:distance],
                                 duration: res[3][:duration] }
    end
    points
  end

  private

  def uber_client
    Uber::Client.new do |config|
      config.server_token = ENV["UBER_SERVER_TOKEN"]
      config.client_id = ENV['UBER_CLIENT_ID']
      config.client_secret = ENV['UBER_CLIENT_SECRET']
    end
  end
end