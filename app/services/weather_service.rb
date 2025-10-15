class WeatherService
  include HTTParty
  base_uri 'api.openweathermap.org/data/2.5'

  def self.call(lat, lon)
    api_key = ENV['WEATHER_API_KEY']
    response = get("/weather", query: { lat: lat, lon: lon, appid: api_key, units: 'metric' })
    data = response.parsed_response
    {
      temperature: data['main']['temp'],
      temperature_min: data['main']['temp_min'],
      temperature_max: data['main']['temp_max'],
      humidity: data['main']['humidity'],
      pressure: data['main']['pressure'],
      description: data['weather'][0]['description']
    }
  end
end
