Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'my_account', to: 'pages#my_account'

  resources :flats, except: :delete  do
    resources :rentals
  end

end
