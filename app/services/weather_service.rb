class WeatherService
  def weather(city_state)
    JSON.parse(darksky.forecast(*geocode.location(city_state)), symbolize_names: true)
  end

  private

  def geocode
    @@geocode ||= GeocodeService.new
  end

  def darksky
    @@darksky ||= DarkskyService.new
  end
end
