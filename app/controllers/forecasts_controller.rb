require 'httparty'

class ForecastsController < ApplicationController
  def show
    pincode = params[:address]
    unless pincode =~ /\A\d{6}\z/
      flash.now[:alert] = "Enter a valid 6-digit pin code."
      return render :show
    end

    api_url = "https://api.postalpincode.in/pincode/#{pincode}"
    response = HTTParty.get(api_url)
    data = response.parsed_response

    if data[0]["Status"] == "Success"
      place_info = data[0]["PostOffice"][0]
      @district = place_info["District"]
      @state = place_info["State"]
      @country = place_info["Country"]

      # Get coordinates via geocoding
      location_str = "#{@district}, #{@state}, #{@country}"
      geocode_url = "https://nominatim.openstreetmap.org/search?q=#{CGI.escape(location_str)}&format=json&limit=1"
      geo_response = HTTParty.get(geocode_url)
      geo_data = geo_response.parsed_response
      if geo_data.any?
        lat = geo_data[0]["lat"]
        lon = geo_data[0]["lon"]
        @weather = WeatherService.call(lat, lon)
      else
        flash.now[:alert] = "Unable to find coordinates for this pin code."
      end

    else
      flash.now[:alert] = "Invalid or unknown pin code."
      return render :show
    end
  end
end
