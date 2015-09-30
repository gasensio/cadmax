class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_timezone

  add_flash_types :success, :warning, :danger, :info

 def set_timezone
   Time.zone = 'Madrid'
 end

  
end
