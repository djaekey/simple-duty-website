Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :duty_schedules
  resources :problem_reports
  resources :users

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#login_submit'
  delete 'logout', to: 'sessions#logout'
end
