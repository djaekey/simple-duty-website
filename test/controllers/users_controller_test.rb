require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	has_many :problem_reports
	has_many :duty_schedules

end
