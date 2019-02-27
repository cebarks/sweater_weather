require 'rails_helper'

describe "Geocode Service" do
  before(:each) do
    @service = GeocodeService.new
  end
  it "can return a lat/long for a city", :vcr do
    res = @service.location("Denver,CO")

    expect(res).to be_a(Array)

    res.each do |e|
      expect(e).to be_a(Float)
    end
  end

  it "will return from database if it exists" do
    Location.create!(name: 'special,city', location: "666,-666")

    res = @service.location("special,city")

    expect(res).to eq([666, -666])
  end
end
