Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'my_account', to: 'pages#my_account'
  get 'privacy_policy', to: 'pages#privacy_policy'

  resources :flats, except: [:index, :delete]  do
    get 'rentals/:id/accept', to: 'rentals#join_flat'
    post 'rentals/:id/accept', to: 'rentals#accept_rental', as: 'accept_rental'
    resources :rentals do
      resources :tickets do
        resources :comments, only: [:create, :edit, :destroy]
      end
    end
  end

  get '/flats/:id/users', to: 'flats#users_in_flat', as:'users_in_flat'
  get '/flats/:id/tickets', to: 'flats#tickets_of_flat', as:'tickets_of_flat'

  get 'my_account/unread_tickets', to: 'tickets#unread'

  post 'tickets/:id/unread', to: 'tickets#mark_as_unread', as: 'mark_as_unread'

end
