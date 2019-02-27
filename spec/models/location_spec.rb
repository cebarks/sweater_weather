require 'rails_helper'

RSpec.describe Location, type: :model do
  it {should validate_presence_of :name}
  it {should validate_presence_of :location}
  it {should validate_uniqueness_of :name}
  it {should validate_uniqueness_of :location}

  describe "instance methods" do
    before(:each) do
      @location = Location.create!(name: 'denver,co', location: '39.7392358,-104.990251')
    end

    it "#lat" do
      expect(@location.lat).to eq(39.7392358)
    end
    
    it "#long" do
      expect(@location.long).to eq(-104.990251)
    end
  end
end
