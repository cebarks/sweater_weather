class Day
  def initialize(params, extra = nil)
    @date = Time.at(params[:time])
    @day_of_week = @date.strftime("%A").downcase
    @weather_type = params[:summary]
    @precipitation_chance = params[:precipProbability]
    @temperature_low = params[:temperatureMin]
    @temperature_high = params[:temperatureMax]
    if extra
      @temperature = extra.first[:temperature]

      @hourly = extra.reduce({}) do |hash, hour|
        hash[Time.at(hour[:time]).hour] = hour[:temperature]
        hash
      end
    end
  end

  def hsh
    hash = {
      day: @day_of_week,
      weather_type: @weather_type,
      precipitation_chance: @precipitation_chance,
      temperature_high: @temperature_high,
      temperature_low: @temperature_low
    }

    if @hourly
      hash[:current_temperature] = @temperature
      hash[:hourly] = @hourly
    end

    hash
  end
end
