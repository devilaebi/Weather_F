Rails.application.routes.draw do
  # Root route to display forecast page by default
  root "forecasts#show"

  # Route to forecasts#show to handle explicit /show URL
  get 'show', to: 'forecasts#show', as: :show_forecast

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
