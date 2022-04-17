Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/", to: "main#index"
  
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registration#create"


  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
end
