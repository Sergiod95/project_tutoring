Rails.application.routes.draw do
  resources :professors
  resources :users
  resources :appointments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/", to: "main#index"

  root to: "main#index"

  get "users", to: "users#index"
  get "professors", to: "professors#index"

  get "appointments", to: "appointments#index"
  get "list",  to: "appointments#list"
  get "new", to: "appointments#new"
  post "new", to: "appointments#new"
  get "/appointments/:id/edit", to: "appointments#edit", as: 'edit'
  get "appointments/:id/join", to: "appointments#join", as: 'join'
  get "appointments/:id/remove", to: "appointments#remove", as: 'remove'
  get "appointments/register", to: "appointments#register", as: 'register'


  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  
end
