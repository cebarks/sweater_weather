require 'rails_helper'

describe "Darksky Service" do
  it "can get weather for a lat,long", :vcr do
    service = DarkskyService.new

    res = JSON.parse(service.forecast(39.7392358,-104.990251), symbolize_names: true)

    expect(res).to have_key(:currently)
    expect(res[:currently]).to have_key(:summary)
    expect(res[:currently]).to have_key(:temperature)
    expect(res[:currently]).to have_key(:apparentTemperature)

    expect(res).to have_key(:hourly)
    expect(res[:hourly]).to have_key(:summary)
    expect(res[:hourly]).to have_key(:data)
    expect(res[:hourly][:data]).to be_a(Array)

    expect(res).to have_key(:daily)
    expect(res[:daily]).to have_key(:summary)
    expect(res[:daily]).to have_key(:data)
    expect(res[:daily][:data]).to be_a(Array)
    expect(res[:daily][:data].length).to eq(8)
  end
end
