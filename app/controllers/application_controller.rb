class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :require_key
  before_action :current_user

  def require_key
    return render json: {errors: {credentials: "You must supply an api_key in your request."}}, status: 401 unless params[:api_key]
    return render json: {errors: {credentials: "The api_key you supplied is invalid."}}, status: 401 unless current_user
  end

  def current_user
    @current_user ||= User.find_by(api_key: params[:api_key])
  end
end
