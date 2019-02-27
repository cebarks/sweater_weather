class Api::V1::FavoritesController < ApplicationController
  before_action :require_key

  def index
    render json: FavoriteSerializer.new(current_user.favorites)
  end

  def create
    @favorite = Favorite.new(user: current_user, location: Location.find(params[:location]))

    if @favorite.save
      render json: FavoriteSerializer.new(@favorite), status: 201
    else
      render json: { errors: @favorite.errors }, status: 500
    end
  end

  def destroy
    @favorite = Favorite.find_by(user: current_user, location: params[:location])
    @favorite.destroy
    render json: FavoriteSerializer.new(@favorite)
  end
end
