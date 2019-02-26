class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: FlickrBackground.new(params[:location]).hsh
  end
end
