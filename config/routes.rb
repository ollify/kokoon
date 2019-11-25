Rails.application.routes.draw do
  devise_for :users
  root to: 'flats#index'

  resources :users, only: [:new, :edit, :update]
  get 'my_account', to: 'pages#my_account'

  resources :flats, except: :delete

end
