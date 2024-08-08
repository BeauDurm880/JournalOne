# config/routes.rb
Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users, controllers: { sessions: 'devise/sessions' } do
    get '/users/sign_out', to: 'devise/sessions#destroy' # Explicit sign-out route
  end

  # Add a custom route for the account page
  get 'account', to: 'users#account', as: 'user_account'

  # Root path set to journals#index if it is your landing page
  root 'journals#index'

  # Resources for journals mapped to JournalsController
  resources :journals

  # Routes for reports
  get 'reports/day_rating', to: 'reports#day_rating' # Route to view day ratings
  get 'reports/day_rating_pdf', to: 'reports#day_rating_pdf', as: 'day_rating_pdf' # Route to generate PDF of day ratings
  post 'reports/upload_chart_image', to: 'reports#upload_chart_image' # Route to upload chart image

  # Routes for training resources
  resources :training_resources

  # Additional routes can be added here
end









