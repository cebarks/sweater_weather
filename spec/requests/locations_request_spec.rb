require 'rails_helper'

describe "locations API" do
  it "shows a location" do
    location = Location.create!(name: 'denver,co', location: '39.7392358,-104.990251')
    user = User.create!(email: 'test@example.com', password: '123', password_confirmation: '123')

    get '/api/v1/locations', params: {location: location.id, api_key: user.api_key}, headers: {"CONTENT_TYPE" => "application/json"}

    res = parse_json

    expect(res[:id].to_i).to eq(location.id)
    expect(res[:type]).to eq('location')
    expect(res).to have_key(:attributes)
    expect(res[:attributes][:name]).to eq(location.name)
    expect(res[:attributes][:lat]).to eq(location.lat)
    expect(res[:attributes][:long]).to eq(location.long)
  end
end
