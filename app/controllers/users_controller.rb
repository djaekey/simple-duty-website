class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new # for create
  		@users = User.new
	end

	def create
		user = User.new user_params
	  if user.save
    	redirect_to users_path
	  else
	    redirect_to new_user_path
	  end
	end

	def show
	  @user = User.find params[:id]
	  @problem_reports = ProblemReport.where({user_id: @user.id})
	end

	def update # for edit
		user = User.find params[:id]
		if user.update user_params
			redirect_to users_path
		else
			redirect_to edit_user_path
		end
	end

	def edit
		@users = User.find params[:id]
	end

	def destroy
		user = User.find params[:id]
		if user.destroy
			redirect_to users_path
		end
	end

	private
		def user_params
		  params.require(:user).permit(:name)
		end
end
