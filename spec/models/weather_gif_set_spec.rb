require 'rails_helper'

describe WeatherGifSet do
  it "can create a set of gifs representing the weather", :vcr do
    gifs = WeatherGifSet.new("denver,co")

    hash = gifs.hsh

    expect(hash[:copyright]).to eq(Time.now.year)
    
    hash[:data][:images].each do |image|
      expect(image).to have_key(:time)
      expect(image).to have_key(:summary)
      expect(image).to have_key(:url)
    end
  end
end
