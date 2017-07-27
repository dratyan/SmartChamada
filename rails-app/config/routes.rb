Rails.application.routes.draw do
  root 'main#index'
  resources :users do
    member do
      get 'add_course'
      post 'add_course'
      post 'remove_course'
      get 'add_roll_call'
    end
  end
  resources :tests
  resources :courses
  resources :roll_calls
  post '/authenticate', to: 'users#authenticate'
  post '/register', to: 'attendances#register'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
