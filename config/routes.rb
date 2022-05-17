Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations", sessions: "sessions"}
  get 'home/index'
  get 'home/construct'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'app/create', to: 'app#create'
  get 'form', to: 'app#form'
  get 'pur', to: 'app#pur'
  get 'admin', to: 'app#admin'
  post 'app/new', to: 'app#new'
  post 'app/min', to: 'app#min'
  # Defines the root path route ("/")
  root "home#index"
end
