Rails.application.routes.draw do
  resources :grades
  resources :lessons
  resources :course_modules
  resources :courses
  resources :trainings

  devise_for :users, :path_prefix => 'system'



  root'page#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :course_enrollements#, only: [:show, :update]
end
