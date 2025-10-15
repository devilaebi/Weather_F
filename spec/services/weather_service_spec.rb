require 'rails_helper'

RSpec.describe WeatherService do
  it "retrieves weather data for valid coordinates" do
    result = WeatherService.call(37.33182, -122.03118)
    expect(result[:temperature]).not_to be_nil
  end
end
