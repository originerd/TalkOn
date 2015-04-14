require 'api_constraints'

Rails.application.routes.draw do

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :talk_concerts do
    member do
      get :room
    end
    resource :enrollments, only: [:create, :destroy]
    resource :voices,      only: [:create, :destroy]
  end
end
