class FlickrBackground
  attr_reader :url

  def initialize(city_state)
    service = FlickrService.new
    @url = build_photo_url(service.background(GeocodeService.new.location(city_state)))
  end

  def parse_response(response)
    response
  end

  private

  def build_photo_url(farm, server, id, secret)
    "https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}.jpg"
  end
end
