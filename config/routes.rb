Rails.application.routes.draw do
  resources :blogs

  #ログイン関係
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
end
