class WeatherGifSet
  def initialize(location)
    @location = location
    @weather = WeatherForecast.new(location: @location)
  end

  def hsh
    {
      copyright: "",
      data: {
        images: @weather.future.map(&:gif)
      }
    }
  end
end
