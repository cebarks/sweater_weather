require 'rails_helper'

describe "Flickr Service" do
  it "can return an image", :vcr do
    service = FlickrService.new

    res = JSON.parse(service.background(39.7392358, -104.990251), symbolize_names: true)

    expect(res).to have_key(:photos)
    expect(res[:photos]).to have_key(:photo)
    expect(res[:photos][:photo].first).to have_key(:id)
    expect(res[:photos][:photo].first).to have_key(:secret)
    expect(res[:photos][:photo].first).to have_key(:server)
    expect(res[:photos][:photo].first).to have_key(:farm)
  end
end
