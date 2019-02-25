require 'rails_helper'

describe "Geocode Service" do
  it "can return a lat/long for a city" do
    service = GeocodeService.new

    res = service.location("Denver,CO")

    expect(res).to be_a(Array)

    res.each do |e|
      expect(e).to be_a(Float)
    end

    # expect(res).to have_key(:results)
    # expect(res[:results].first).to have_key(:geometry)
    # expect(res[:results].first[:geometry]).to have_key(:location)
    # expect(res[:results].first[:geometry][:location]).to have_key(:lat)
    # expect(res[:results].first[:geometry][:location]).to have_key(:lng)
    #
    # expect(res[:results].first[:geometry][:location][:lat]).to eq(39.7392358)
    # expect(res[:results].first[:geometry][:location][:lng]).to eq(-104.990251)
  end
end
