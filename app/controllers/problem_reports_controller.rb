class ProblemReportsController < ApplicationController
	def index
		@problem_reports = ProblemReport.all
	end

	def new # for create
  		@problem_reports = ProblemReport.new
  		@users = User.all

	end

	def create
		problem_report = ProblemReport.new problem_report_new_params
		problem_report.date = DateTime.now
		problem_report.status = "Broken"


	  if problem_report.save
    	redirect_to problem_reports_path
	  else
	    redirect_to new_problem_reports_path
	  end
	end

	def show
	  @problem_report = ProblemReport.find params[:id]
	end

	def update # for edit
		problem_report = ProblemReport.find params[:id]
		if problem_report.update problem_report_edit_params
			redirect_to problem_report_path
		else
			redirect_to edit_problem_report_path
		end
	end

	def edit
		@problem_reports = ProblemReport.find params[:id]
	end

	def destroy
		problem_report = ProblemReport.find params[:id]
		if problem_report.destroy
			redirect_to problem_reports_path
		end
	end

	private
		def problem_report_new_params
		  params.require(:problem_report).permit(:user_id, :computer_number, :details)
		end

		def problem_report_edit_params
		  params.require(:problem_report).permit(:computer_number, :details, :status)
		end
end
