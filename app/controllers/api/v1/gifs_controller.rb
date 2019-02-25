class Api::V1::GifsController < ApplicationController
  def index
    render json: WeatherGifSet.new(params[:location]).hsh
  end
end
