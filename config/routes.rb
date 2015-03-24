require 'api_constraints'

Rails.application.routes.draw do

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :talk_concerts do
    resource :enrollments, only: [:create, :destroy]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource  :users,    only: [:index, :create, :update, :destroy]
      resources :users,    only: :show
      resource  :sessions, only: [:create, :destroy]
    end                                
  end
end
