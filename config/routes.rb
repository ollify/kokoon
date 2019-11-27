Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
  get 'my_account', to: 'pages#my_account'
  get 'privacy_policy', to: 'pages#privacy_policy'

  resources :flats, except: [:index, :delete]  do
    get '/:id/users', to: 'flats#users_in_flat', as:'users_in_flat'
    resources :rentals, except: [:index, :show] do
      get ':id/accept', to: 'rentals#join_flat'
      post ':id/accept', to: 'rentals#accept_rental', as: "accept_rental"
    end
  end

  # get '/flats/:flat_id/rentals/:id/accept', to: 'rentals#join_flat'
  # post '/flats/:flat_id/rentals/:id/accept', to: 'rentals#accept_rental', as: "accept_rental"

  # get '/flats/:id/users', to: 'flats#users_in_flat', as:'users_in_flat'
end
