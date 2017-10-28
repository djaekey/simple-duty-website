Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :duty_schedules
  resources :problem_reports
  resources :users
end
