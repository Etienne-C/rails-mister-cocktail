Rails.application.routes.draw do
  get 'doses/index'

  get 'doses/new'

  get 'doses/create'

  root to: 'cocktails#index'
  resources :cocktails do
    resources :doses, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
