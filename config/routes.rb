Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'my_account', to: 'pages#my_account'
  get 'privacy_policy', to: 'pages#privacy_policy'

  resources :flats, except: :delete  do
    resources :rentals
  end

  get '/flats/:flat_id/rentals/:id/accept', to: 'rentals#join_flat'
  post '/flats/:flat_id/rentals/:id/accept', to: 'rentals#accept_rental', as: "accept_rental"

end
