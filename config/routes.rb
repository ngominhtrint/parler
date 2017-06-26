Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create]
  resources :conversations, only: [:create] do
    resources :messages, only: [:create]
  end

  delete 'logout' => 'sessions#destroy'

  root 'home#index'
  
  get 'home/index'
  
  get "/conversation/:id/new" => "conversations#new", as: :new_conversation

  get "/conversation/:conversation_id/messages/:id/view" => "messages#view", as: :view_message

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
