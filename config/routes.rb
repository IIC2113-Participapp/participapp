Rails.application.routes.draw do
  root to: 'static_pages#home'

  get 'static_pages/about'
  get 'static_pages/contact'

  devise_for :users, :controllers => { registrations: 'registrations' }
  get '/users', to: 'users#index'
  post '/toggle_admin', to: 'users#toggle_admin'
  post '/toggle_editor', to: 'users#toggle_editor'

  resources :forums
  resources :comments, only: [:create, :update, :destroy]

  # Rutas para la API versión 1. Cada ruta redirige el request a un
  # controller distinto segun su función.
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'contents', to: 'contents#index'
      get 'contents/:id', to: 'contents#show'
      get 'contents/category/:id', to: 'categories#show'
    end
  end

  resources :categories
  resources :contents do
    put 'authorize', to: 'contents#authorize'
    put 'reject', to: 'contents#reject'
  end

  get '/pending_authorization', to: 'contents#pending_authorization'
end
