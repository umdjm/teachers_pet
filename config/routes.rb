TeachersPet::Application.routes.draw do
  get "home/index"

  resources :courses
  resources :students
  root :to => "home#index"
end
