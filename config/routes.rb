Rails.application.routes.draw do
  devise_for :users
  root to: 'users#show'

  resources :users, only: [:edit, :update]
  get 'my_account', to: 'users#show'

  resources :flats, except: :delete

end
