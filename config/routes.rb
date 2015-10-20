Rails.application.routes.draw do
  root to: 'static_pages#home'

  get 'static_pages/about'
  get 'static_pages/contact'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :comment, only: [:create, :update, :destroy]
  resources :forums

  # Rutas para la API versión 1. Cada ruta redirige el request a un
  # controller distinto segun su función.
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'contents', to: 'contents#index'
      get 'contents/:id', to: 'contents#show'
      get 'contents/category/:id', to: 'categories#show'
    end
  end

  resources :contents
  resources :categories
end
