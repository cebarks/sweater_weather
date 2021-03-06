class WeatherForecast
  attr_reader :future, :today
  def initialize(params)
    @service = WeatherService.new
    @city, @state = params[:location].split(',').map(&:titleize)
    @background_href = "https://as-sweater-weather.herokuapp.com/api/v1/backgrounds?location=#{params[:location]}"
    parse_weather @service.weather(params[:location])
  end

  def parse_weather(weather)
    @country = false || "United States"

    @today = Day.new(weather[:daily][:data].first, weather[:hourly][:data])
    @future_forecast = weather[:daily][:summary]
    @future = weather[:daily][:data].map {|e| Day.new(e)}
  end

  def hsh
    {
      data: {
        info: {
          city: @city,
          state: @state,
          country: @country,
          background_href: @background_href
        },
        weather: {
          today: @today.hsh,
          future: {
            forecast: @future_forecast,
            data: @future.map(&:hsh)
          }
        }
      }
    }
  end

  private
end
