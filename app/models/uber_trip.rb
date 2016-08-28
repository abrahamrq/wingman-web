class UberTrip
  def initialize
    @uber_client = uber_client
  end

  def estimations(points)
    points.each_with_index do |point, index|
      break if points.count < 2
      next if index < 1

      origin = points[index - 1]
      destination = points[index]
      res = @uber_client.price_estimations(start_latitude: origin[:lat],
                                           start_longitude: origin[:lon],
                                           end_latitude: destination[:lat],
                                           end_longitude: destination[:lon])

      points[index - 1][:uber_x] = { estimate: res[0][:estimate],
                                     distance: res[0][:distance],
                                     duration: res[0][:duration] }
      points[index - 1][:uber_b] = { estimate: res[3][:estimate],
                                     distance: res[3][:distance],
                                     duration: res[3][:duration] }
      points
    end
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