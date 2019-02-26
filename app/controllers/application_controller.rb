class ApplicationController < ActionController::Base
  helper_method :require_key

  def require_key
    # require 'pry'; binding.pry
  end
end
