class FlickrBackground
  attr_reader :url

  def initialize(city_state)
    service = FlickrService.new
    res = service.background(*GeocodeService.new.location(city_state))
    @url = build_photo_url(*parse_response(res))
  end

  def parse_response(response)
    res = JSON.parse(response, symbolize_names: true)
    
    farm = res[:photos][:photo].first[:farm]
    server = res[:photos][:photo].first[:server]
    id = res[:photos][:photo].first[:id]
    secret = res[:photos][:photo].first[:secret]

    [farm, server, id, secret]
  end

  def hsh
    {
      data: {
        url: @url
      }
    }
  end

  private

  def build_photo_url(farm, server, id, secret)
    "https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}.jpg"
  end
end
