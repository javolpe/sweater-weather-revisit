require 'rails_helper'

RSpec.describe WeatherClient do
  describe ".get_forecast_response" do
    let(:lat) { 33.44 }
    let(:long) { -94.04 }
    let(:forecast) { WeatherClient.send(:get_forecast_response, lat, long) }

    it "is successful when given proper params" do
      expect(forecast.status).to eq(200)
    end
  end

  describe ".call" do
    context "when successfully called" do
      let(:lat) { 33.44 }
      let(:long) { -94.04 }
      let(:parsed_forecast) { WeatherClient.call(lat, long) }

      it "returns hash of weather data" do
        expect(parsed_forecast.class).to eq(Hash)
        expect(parsed_forecast.keys).to include(
          :lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily, :alerts
        )
      end
    end
  end
end
