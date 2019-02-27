require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should have_many(:favorites)}
  end

  describe "instance methods" do
    it "#api_key" do
      user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")

      expect(user.api_key).to eq("40af33c4bcab652bd665d78382ac9a424b53e1a96ef2619dfb67e66e2ea79c5d")
    end
  end
end
