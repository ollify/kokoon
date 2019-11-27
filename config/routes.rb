Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'my_account', to: 'pages#my_account'
  get 'privacy_policy', to: 'pages#privacy_policy'

  resources :flats, except: [:index, :delete]  do
    resources :rentals, except: [:index, :show]
    get 'rentals/:id/accept', to: 'rentals#join_flat'
    post 'rentals/:id/accept', to: 'rentals#accept_rental', as: "accept_rental"
  end

  # get '/flats/:flat_id/rentals/:id/accept', to: 'rentals#join_flat'
  # post '/flats/:flat_id/rentals/:id/accept', to: 'rentals#accept_rental', as: "accept_rental"

end
