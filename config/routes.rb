Rails.application.routes.draw do
  resources :replies
  resources :posts
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
  get "historial",  to: "appointments#historial"
  get "new", to: "appointments#new"
  post "new", to: "appointments#new"

  get "/appointments/:id/edit", to: "appointments#edit", as: 'edit'
  get "appointments/:id/join", to: "appointments#join", as: 'join'
  get "appointments/:id/remove", to: "appointments#remove", as: 'remove'
  get "appointments/register", to: "appointments#register", as: 'register'
  get "appointments/:date/calendarlist", to: "appointments#calendarlist", as: 'calendarlist'

  get "posts/:id/classforum", to: "posts#classforum", as: 'classforum'
  #post "posts/:id/classforum", to: "posts#classforum"
  get "posts/:id/new", to: "posts#new", as: 'postnew'
  post "posts/:id/new", to: "posts#new"

  get "posts/:id/reply/new", to: "replies#new", as: 'newreplay'
  post "posts/:id/reply/new", to: "replies#new"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  
end
