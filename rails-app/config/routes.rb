Rails.application.routes.draw do
  root 'main#index'
  resources :users do
    member do
      get 'add_course'
      post 'add_course'
      post 'remove_course'
    end
  end
  resources :tests
  resources :courses
  post '/authenticate', to: 'users#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
