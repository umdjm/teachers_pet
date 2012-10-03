TeachersPet::Application.routes.draw do
  get "home/index"

  resources :courses

  resources :students
  resources :grades
  resources :assignments

  root :to => "home#index"
end
