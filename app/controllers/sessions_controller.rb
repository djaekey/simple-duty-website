class SessionsController < ApplicationController
	skip_before_action :check_login

	def login # not necessary
	end

	def login_submit
		username = params[:username] # :username && 'username' are the same
		password = params[:password] # it's in the main hash, so can directly access it, no need Book.find(params[:id])
									# Book.find has a new hash table cos of the form_for

		user = User.find_by(username: username) # if it doesn't exits, it will return nil & go to the "else"

		if user && user.authenticate(password)
			#Login
			session[:user_id] = user.id # cookies are key-value pair
										# session is the encrypted version of cookie
			redirect_to problem_reports_path
		else
			#Fail
			render :login
		end
	end

	def logout
		session.delete(:user_id)
		redirect_to login_path
	end

end
