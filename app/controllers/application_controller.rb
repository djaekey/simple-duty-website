class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_login

  def check_login
  	# redirect_to login_path unless session.include?(:user_ide)
  	if !session.include?(:user_id)
			redirect_to login_path
		end
	end
end
