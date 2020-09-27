Rails.application.routes.draw do

  # get 'inquiries/index'
  # get 'inquiries/confirm'
  # get 'inquiries/complete'
  root to: "homes#top"
  get "homes/about"
  get "articles/posted"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :articles do
    resources :article_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :inquiries
end
