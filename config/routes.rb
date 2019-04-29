Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  devise_for :users
  resources :images do
    post 'download' => 'images#download'
    get 'tag' => 'images#tag', on: :collection
  end
  resources :illustrations do
    post 'download' => 'illustrations#download'
    post 'tag' => 'illustrations#tag'
  end
  resources :movies do
    post 'download' => 'movies#download'
    post 'tag' => 'movies#tag'
  end
  resources :test

  get 'terms', to: 'terms#index'
  

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
