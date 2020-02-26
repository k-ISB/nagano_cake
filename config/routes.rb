Rails.application.routes.draw do
  
  root "public/items#top"
  namespace :public do
    get 'items/top'
    get 'items/show'
    resources :end_users, only: [:show, :edit, :update]
    get 'end_users/delete_verification'
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :exit, :update]
  end

  devise_for :admins
  devise_for :end_users
  resources :end_users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
