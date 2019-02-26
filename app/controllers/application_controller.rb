class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :require_key

  def require_key
    # require 'pry'; binding.pry
  end
end
