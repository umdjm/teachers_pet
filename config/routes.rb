TeachersPet::Application.routes.draw do
  get "home/index"

  resources :courses
  resources :students
  root :to => "courses#landing"
end
