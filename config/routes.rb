Rails.application.routes.draw do
  # Ensure the root path is pointing to journals#index if that is your landing page
  root 'journals#index'

  # This should map entries to JournalsController if you're using that naming
  resources :journals, controller: 'journals'
end

