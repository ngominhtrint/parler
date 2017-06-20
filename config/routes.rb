Rails.application.routes.draw do
  
  get 'users/new'

  resources :users

  root 'home#index'
  
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
