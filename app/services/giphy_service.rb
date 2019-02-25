class GiphyService

  def weather_gif(city_state)
    res = conn.get("/v1/gifs/search") do |req|
      req.params["q"] = city_state
    end.body
    JSON.parse(res, symbolize_names: true)[:data].first[:images][:original][:url]
  end

  private

  def conn
    @conn ||= Faraday.new(url: "https://api.giphy.com") do |faraday|
      faraday.params["api_key"] = ENV["GIPHY_KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end
end
