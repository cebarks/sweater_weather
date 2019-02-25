class Api::V1::ForecastsController < ApplicationController
  def show
    render json: WeatherForecast.new(weather_params).hash
  end

  private

  def weather_params
    params.permit(:location)
  end
end
