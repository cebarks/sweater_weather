require 'rails_helper'

describe "backgrounds API" do
  it "background for a city", :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    res = parse_json

    expect(res[:url]).to include("staticflickr.com")
  end
end
