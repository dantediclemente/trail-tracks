Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }

  root 'trails#index'

  authenticate :user do
    resources :trails, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :trails, only: [:index, :show]
end
