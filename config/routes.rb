TeachersPet::Application.routes.draw do
  get "home/index"

  resources :courses
  resources :students
  resources :grades

  root :to => "home#index"
end
