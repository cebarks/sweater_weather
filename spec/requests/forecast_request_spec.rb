require 'rails_helper'

describe 'forecast API' do
  describe 'Endpoints' do
    it '/forecast' do
      get '/api/v1/forecast?location=denver,co'

      res = parse_json

      require 'pry'; binding.pry
      expect(res).to have_key(:info)
      expect(res[:info]).to have_key(:city)
      expect(res[:info]).to have_key(:state)
      expect(res[:info]).to have_key(:country)
      expect(res[:info]).to have_key(:background_href)

      expect(res).to have_key(:weather)
      expect(res[:weather]).to have_key(:today)
      expect(res[:weather][:today]).to have_key(:day)
      expect(res[:weather][:today]).to have_key(:weather_type)
      expect(res[:weather][:today]).to have_key(:precipitation_chance)
      expect(res[:weather][:today]).to have_key(:current_temperature)
      expect(res[:weather][:today]).to have_key(:temperature_high)
      expect(res[:weather][:today]).to have_key(:temperature_low)
      expect(res[:weather][:today]).to have_key(:hourly)
      expect(res[:weather][:today][:hourly]).to be_a(Array)
      expect(res[:weather][:today][:hourly].length).to eq(8)
      expect(res[:weather]).to have_key(:future)
      expect(res[:weather][:future]).to be_a(Array)
      expect(res[:weather][:future].first).to have_key(:day)
      expect(res[:weather][:future].first).to have_key(:weather_type)
      expect(res[:weather][:future].first).to have_key(:percipitation_chance)
      expect(res[:weather][:future].first).to have_key(:temperature_low)
      expect(res[:weather][:future].first).to have_key(:temperature_high)
    end
  end
end

{
  data: {
    info: {
      city: "Denver",
      state: "CO",
      country: "United States",
      background_href: "/api/v1/backgrounds?location=denver,co"
    },
    weather: {
      today: {
        day: "Wednesday",
        weather_type: "Sunny",
        precipitation_chance: "90",
        current_temperature: "45",
        temperature_high: "50",
        temperature_low: "30",
        hourly: [
          "11": "48",
          "12": "50",
          "13": "49"
          # ... 8 hours
        ]
      },
      future: [
        {
          day: "Thursday",
          type: "Sunny",
          precipitation_chance: "90",
          temperature_high: "50",
          temperature_low: "30"
        },
        {
          # ... 8 days
        }
      ]
    }
  }
}
