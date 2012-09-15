TeachersPet::Application.routes.draw do
  resources :courses, :only => [:new, :create]
  resources :students, :only => [:index, :new, :create]
end
