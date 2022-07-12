class WeatherClient
  def self.call(lat, long)
    response = self.get_forecast_response(lat, long)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    connection = Faraday.new(
      url: 'https://api.openweathermap.org',
      params: {appid: ENV["weather_key"]}
    )
  end

  def self.get_forecast_response(lat, long)
    conn.get('/data/2.5/onecall') do |f|
      f.params['lat'] = lat
      f.params['lon'] = long
      f.params['exclude'] = 'minutely'
      f.params['units'] = 'imperial'
    end
  end
end
