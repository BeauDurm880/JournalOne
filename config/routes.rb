Rails.application.routes.draw do
  # Route for the day rating report
  get 'reports/day_rating', to: 'reports#day_rating'

  # Devise routes for user authentication
  # devise_for :users
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Root path set to journals#index if it is your landing page
  root 'journals#index'

  # Resources for journals mapped to JournalsController
  resources :journals
end

