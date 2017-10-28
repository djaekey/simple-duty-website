class User < ApplicationRecord
	has_many :problem_reports
	has_many :duty_schedules
end
