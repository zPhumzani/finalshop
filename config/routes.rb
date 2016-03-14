Rails.application.routes.draw do
  
  get 'help' => 'pages#help', as: :help
  get 'contact' => 'pages#contact', as: :contact

  devise_for :users
  resources :users, only: [:show, :index] do
    resources :profiles
  end
  namespace :admin do
    root 'application#index'

    resources :categories
    resources :classifieds
    resources :users
  end

  resources :classifieds do 
    get 'image', on: :member
  end
  resources :categories, only: [:show, :index]

  post 'search' => 'classifieds#search', as: :search
  get 'tags/:tag', to: 'classifieds#index', as: :tag

  root 'classifieds#index'
end
