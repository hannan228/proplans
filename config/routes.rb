Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'packages#index'
  resources :users, only: [:new, :create, :update, :delete, :forgot_password]
  resources :packages, only: [:index, :new, :create, :edit, :update, :delete]
  resources :sessions, only: [:create]

  delete :destroy_user_session, to: "sessions#logout"
  get :new_user_session, to: "sessions#logged_in"
  get :forgot_password, to: "users#forgot_password"
  post :forgot_password_extend, to: "users#forgot_password_extend"
  get :reset_password, to: "users#reset_password"
  post :reset_password_extend, to: "users#reset_password_extend"
  
  # post 'password/forgot', to: 'password#forgot'
  # post 'password/reset', to: 'password#reset'

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :registrations, only: [:create]
      delete :logout, to: "sessions#logout"
      get :logged_in, to: "sessions#logged_in"
    end
  end
end
