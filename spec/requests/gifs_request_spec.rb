require 'rails_helper'

describe "gifs API" do
  it "weather gifs for a city", :vcr do
    get '/api/v1/gifs?location=denver,co'

    expect(JSON.parse(response.body)).to have_key("copyright")

    res = parse_json

    expect(res).to have_key(:images)
    expect(res[:images]).to be_a(Array)

    res[:images].each do |image|
      expect(image).to have_key(:time)
      expect(image).to have_key(:summary)
      expect(image).to have_key(:url)
    end
  end
end
