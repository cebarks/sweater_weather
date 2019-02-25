class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    render json:
    if @user.authenticate(params[:password])
      success_json
    else
      failure_json
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
