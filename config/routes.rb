Rails.application.routes.draw do
  get 'pages/home'
  root to: 'pages#home'

  resources :posts do
    # post 'comments', to: 'comments#create'
    resources :comments
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
