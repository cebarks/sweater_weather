require 'rails_helper'

describe "users API" do
  describe "succesful" do
    it "user creation" do
      body = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }.to_json

      post '/api/v1/users', params: body, headers: {"CONTENT_TYPE" => "application/json"}

      expect(response.status).to eq(201)
    end

    it "user login" do
      body = {
        email: "whatever@example.com",
        password: "password",
      }.to_json

      User.create!(email: "whatever@example.com", password: "password")

      post '/api/v1/sessions', params: body, headers: {"CONTENT_TYPE" => "application/json"}

      expect(response.status).to eq(200)
    end

    after(:each) do
      expected = {
        api_key: "40af33c4bcab652bd665d78382ac9a424b53e1a96ef2619dfb67e66e2ea79c5d"
      }

      expect(parse_json).to eq(expected)
    end
  end

  it "invalid user login" do
    body = {
      email: "whatever@example.com",
      password: "wrong_password",
    }.to_json

    User.create!(email: "whatever@example.com", password: "password")

    post '/api/v1/sessions', params: body, headers: {"CONTENT_TYPE" => "application/json"}

    expect(JSON.parse(response.body)["errors"]["credentials"]).to eq("Your email or password was incorrect.")
    expect(response.status).to eq(401)
  end

  describe "invalid user creation" do
    it "invalid password confirmation" do
      body = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "wrong_password"
      }.to_json

      post '/api/v1/users', params: body, headers: {"CONTENT_TYPE" => "application/json"}

      expect(JSON.parse(response.body)["errors"]["password_confirmation"].first).to eq("doesn't match Password")
      expect(response.status).to eq(500)
    end
  end
end
