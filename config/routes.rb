Rails.application.routes.draw do
  resources :party_memberships
  resources :sessions

  get 'signup', to: 'users#new', as: 'signup'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :users
  root 'encounters#index'

  resources :encounters do
    resources :messages
    resources :characters
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => "/cable"
end
