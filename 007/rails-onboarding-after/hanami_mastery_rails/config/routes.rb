Rails.application.routes.draw do
  namespace :onboarding do
    post '/signup', to: "registrations#create"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end