Rails.application.routes.draw do
  resources :grades
  resources :lessons
  resources :course_modules
  resources :courses
  resources :trainings

  devise_for :users, :path_prefix => 'system'

  post 'inscription', to: 'users#create_inscription', as: :create_inscription
  get 'inscription', to: 'users#inscription', as: :inscription


  root'page#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :course_enrollements#, only: [:show, :update]
end
