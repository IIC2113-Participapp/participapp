Rails.application.routes.draw do

  root to: 'static_pages#home'

  get 'static_pages/about'
  get 'static_pages/contact'

  devise_for :users, :controllers => { registrations: 'registrations' }
  get '/users', to: 'users#index'
  put '/toggle_admin', to: 'users#toggle_admin'
  put '/toggle_editor', to: 'users#toggle_editor'
  delete '/destroy_user', to: 'users#destroy'

  resources :forums
  resources :comments, only: [:create, :update, :destroy]

  # Rutas para la API versión 1. Cada ruta redirige el request a un
  # controller distinto segun su función.
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'contents', to: 'contents#index'
      get 'contents/:id', to: 'contents#show'
      post 'contents', to: 'contents#create'
      get 'categories', to: 'categories#index'
      get 'categories/:id', to: 'categories#show'
    end
  end

  resources :categories, except: [:show, :new]
  resources :contents do
    put 'auth_status', to: 'contents#change_auth_status'
  end

  get '/pending_authorization', to: 'contents#pending_authorization'

  get 'mailer(/:action(/:id(.:format)))' => 'mailer#:action'
end
