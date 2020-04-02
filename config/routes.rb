Rails.application.routes.draw do
  get 'comments/create'

  root to: 'posts#index'
get '/login' => 'admin/sessions#new'
get '/logout' => 'admin/sessions#destroy'
  namespace :admin do
    resources :settings, only: [:new,:create,:edit,:update]
    resources :dashboard, only: [:index]
    resources :notifiactions, only: [:index,:destroy]
    resources :messages, only: [:index,:show,:update,:destroy]
    resources :visitors, only: [:index,:destroy]
    resources :posts
    resources :comments, only: [:index,:update,:destroy]
    resources :tags, except: [:index]
    resources :sessions, only: [:new,:create,:destroy]
    resources :moderators, only: [:index,:edit,:update]
  end
  match 'dismiss_all_notification', to: 'admin/notifiactions#delete_all', via: :delete
  resources :posts, only: [:index,:show]
  resources :messages, only: [:new,:create]
  resources :comments, only: [:create]
end
