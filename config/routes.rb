Rails.application.routes.draw do
  resources :courses
  resources :trainings
  devise_for :users
  root'page#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
