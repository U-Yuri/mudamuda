Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "mudamuda#index"

  get "wants", to: "wants#my_page"
  get "wants/new", to: "wants#new"
  post "wants", to: "wants#create"
  get "wants/:id", to: "wants#show", as: 'want'

  # resource :wants, only: [:wants]
end
