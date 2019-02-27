require 'rails_helper'

describe "favorites API" do
  describe "with api_key" do
    it "can make a new favorite", :vcr do
      location = Location.create!(name: 'denver,co', location: '39.7392358,-104.990251')
      user = User.create!(email: 'test@example.com', password: '123', password_confirmation: '123')

      body = {
        location: location.id,
        api_key: user.api_key
      }.to_json

      post '/api/v1/favorites', params: body, headers: {"CONTENT_TYPE" => "application/json"}

      expect(response.status).to eq(201)
    end

    it "list favorite locations", :vcr do
      location = Location.create!(name: 'denver,co', location: '39.7392358,-104.990251')
      user = User.create!(email: 'test@example.com', password: '123', password_confirmation: '123')
      favorite = Favorite.create!(user: user, location: location)

      body = {
        api_key: user.api_key
      }

      get '/api/v1/favorites', params: body, headers: {"CONTENT_TYPE" => "application/json"}

      res = parse_json.first

      expect(res[:id].to_i).to eq(favorite.id)
      expect(res[:type]).to eq('favorite')
      expect(res[:attributes]).to have_key(:current_weather)
      expect(res[:attributes][:user].to_i).to eq(user.id)
      expect(res[:attributes][:location].to_i).to eq(location.id)
    end

    it "delete favorite location", :vcr do
      location = Location.create!(name: 'denver,co', location: '39.7392358,-104.990251')
      user = User.create!(email: 'test@example.com', password: '123', password_confirmation: '123')
      favorite = Favorite.create!(user: user, location: location)

      delete "/api/v1/favorites?location=#{location.id}&api_key=#{user.api_key}"

      res = parse_json

      expect(res[:id].to_i).to eq(favorite.id)
      expect(res[:type]).to eq('favorite')
      expect(res[:attributes]).to have_key(:current_weather)
      expect(res[:attributes][:user].to_i).to eq(user.id)
      expect(res[:attributes][:location].to_i).to eq(location.id)
    end
  end

  describe "without api_key" do
    it "can make a new favorite" do
      location = Location.create!(name: 'denver,co', location: '39.7392358,-104.990251')

      body = {
        location: location.id
      }.to_json

      post '/api/v1/favorites', params: body, headers: {"CONTENT_TYPE" => "application/json"}

      res = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)
      expect(res[:errors][:credentials]).to eq("You must supply an api_key in your request.")
    end
  end
end
