Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root to: 'tweets#index'
  resources :tweets do
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update]
end
