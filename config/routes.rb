Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'trails#home'

  authenticate :user do
    resources :trails, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :trails, only: [:index, :show]
end
