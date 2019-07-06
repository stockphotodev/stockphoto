Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  devise_for :users, controllers: {
               registrations: 'users/registrations'
             }

  resources :images do
    post 'download' => 'images#download'
    get 'tag' => 'images#tag', on: :collection
  end
  resources :illustrations do
    post 'download' => 'illustrations#download'
    get 'tag' => 'illustrations#tag', on: :collection
  end
  resources :movies do
    post 'download' => 'movies#download'
    get 'tag' => 'movies#tag', on: :collection
  end

  resources :inquiry, only: %i[index] do
    collection do
      post 'confirm'
      post 'thanks'
    end
  end

  resources :test

  get 'terms', to: 'terms#index'
  get 'legal', to: 'legal#index'

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
