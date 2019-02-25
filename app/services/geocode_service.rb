class GeocodeService
  def location(city_state)
    res = conn.get do |req|
      req.params["address"] = city_state
    end.body
    location = JSON.parse(res, symbolize_names: true)[:results].first[:geometry][:location]
    [location[:lat], location[:lng]]
  end

  private

  def conn
    @conn ||= Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json") do |faraday|
      faraday.params["key"] = ENV["GOOGLE_CLOUD_TOKEN"]
      faraday.adapter Faraday.default_adapter
    end
  end
end
