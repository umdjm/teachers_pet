TeachersPet::Application.routes.draw do
  get "home/index"

  resources :courses do
    resources :assignments
  end

  resources :students
  resources :grades

  root :to => "home#index"
end
