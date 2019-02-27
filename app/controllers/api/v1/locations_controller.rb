class Api::V1::LocationsController < ApplicationController
  before_action :require_key

  def show
    render json: LocationSerializer.new(Location.find(params[:location]))
  end
end
