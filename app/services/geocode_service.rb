# app/services/geocode_service.rb
class GeocodeService
  include HTTParty
  base_uri 'nominatim.openstreetmap.org'

  def self.call(address)
    response = get("/search", query: { q: address, format: 'json', addressdetails: 1 })
    loc = response.parsed_response.first
    {
      latitude: loc['lat'],
      longitude: loc['lon'],
      country_code: loc['address']['country_code'],
      postal_code: loc['address']['postcode']
    }
  end
end
