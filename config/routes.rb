Rails.application.routes.draw do


  get 'signup',to: 'users#new'
  post 'signup', to: 'users#create'
  get 'users/home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
