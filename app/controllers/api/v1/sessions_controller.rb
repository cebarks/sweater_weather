class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])

    if @user.authenticate(params[:password])
      render json: success_json
    else
      render json: failure_json, status: 401
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

  def failure_json
    {
      errors: {
        credentials: "Your email or password was incorrect."
      }
    }
  end
end
