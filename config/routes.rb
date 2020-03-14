Rails.application.routes.draw do
  
  root "public/items#top"
  # namespace :public do
  #   get 'items/top'
  #   get 'items/show'
  #   resources :end_users, only: [:edit, :update]
  #   get '/end_users', to: 'end_users#show', as: 'end_users'
  #   get 'end_users/delete_verification'
  # end

  scope module: :public do
    get 'items/top'
    resources :items, only: [:show]
    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete 'cart_items/destroy_all'
    resources :end_users, only: [:edit, :update]
    get '/end_users', to: 'end_users#show', as: 'end_users'
    get 'end_users/delete_verification'
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :exit, :update]
    resources :end_users, only: [:index, :show, :edit, :update]
  end

  devise_for :admins
  devise_for :end_users
  resources :end_users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
