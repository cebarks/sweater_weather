class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)


    if @user.save
      render json: success_json, status: 201
    else
      render json: failure_json
    end
  end

  private

  def success_json
    {
      data: {
        api_key: @user.api_key
      }
    }
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
