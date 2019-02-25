require 'rails_helper'

describe "Giphy Service" do
  it "can get a gif for the weather", :vcr do
    service = GiphyService.new

    url = service.weather_gif("sunny")

    expect(url).to be_a(String)
    expect(url).to include("giphy.com/media")
  end
end
