class ProblemReportsController < ApplicationController
	def index
		@problem_reports = ProblemReport.all
	end

	def new
  		@problem_reports = ProblemReport.new
  		@users = User.all

	end

	def create
		problem_report = ProblemReport.new problem_report_params
		problem_report.date = DateTime.now
		problem_report.status = "Broken"


	  if problem_report.save
    	redirect_to problem_reports_path
	  else
	    redirect_to new_problem_reports_path
	  end
	end

	def edit
		@problem_reports = ProblemReport.find params[:id]
	end

	private
		def problem_report_params
		  params.require(:problem_report).permit(:user_id, :computer_number, :details)
		end
end
