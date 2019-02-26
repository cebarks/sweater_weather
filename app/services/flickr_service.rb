class FlickrService
  def background(lat, long, name = nil)
    conn.get do |request|
      request.params["method"] = flickr.photos.getRecent
      request.params["accuracy"] = "11"
      request.params["lat"] = lat
      request.params["long"] = long

      request.params["text"] = name if name
    end
  end

  private

  def conn
    @conn ||= Faraday.new(url:"https://api.flickr.com/services/rest/") do |faraday|
      faraday.params["api_key"] = ENV["FLICKR_KEY"]
      faraday.params["format"] = "json"
      faraday.params['nojsoncallback'] = "true"

      faraday.adapter Faraday.default_adapter
    end
  end
end
