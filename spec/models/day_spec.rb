require 'rails_helper'

describe Day do
  describe "instance methods" do
    it "#gif", :vcr do
      service = GiphyService.new
      day = Day.new(time: 0, summary: "snowy")

      gif = day.gif(service)

      expect(gif).to be_a(Hash)
      expect(gif[:time]).to eq(Time.at(0))
      expect(gif[:summary]).to eq("snowy")
      expect(gif[:url]).to be_a(String)
    end
  end
end
