class WeatherGifSet
  def initialize(location)
    @location = location
    @weather = WeatherForecast.new(location: @location)
    @service = GiphyService.new
  end

  def hsh
    {
      copyright: Time.now.year,
      data: {
        images: gif_hashes
      }
    }
  end

  private

  def gif_hashes
    @weather.future.map {|e| e.gif(@service)}
  end
end
