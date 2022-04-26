Rails.application.routes.draw do
  resources :users
  resources :appointments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/", to: "main#index"

  root to: "main#index"

  get "users", to: "users#index"


  get "appointments", to: "appointments#index"
  get "edit", to: "appointments#edit", as: 'edit'
  get "new", to: "appointments#new"
  post "new", to: "appointments#new"
  get "appointmenst/:id/join", to: "appointments#join", as: 'join'


  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  
end
