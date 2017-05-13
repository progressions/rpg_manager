Rails.application.routes.draw do
  get 'characters/new'

  get 'characters/edit'

  get 'characters/create'

  get 'characters/update'

  get 'characters/destroy'

  resources :characters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
