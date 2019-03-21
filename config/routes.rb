Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  devise_for :users
  resources :images do
    post 'download' => 'images#download'
  end
  resources :illustrations do
    post 'download' => 'illustrations#download'
  end
  resources :movies
  resources :test

  namespace :admin do
    get '/' => 'top#index'
    devise_for :admin_users
    resources :images
    resources :illustrations
    resources :movies
    resources :categories
    resources :tags
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
