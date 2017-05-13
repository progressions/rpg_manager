Rails.application.routes.draw do
  get 'encounters/index'

  resources :encounters do
    resources :messages
    resources :characters
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => "/cable"
end
