Rails.application.routes.draw do

  root :to => 'home#index'

  devise_for :sns_users, controllers: {
    registrations: "sns_users/registrations",
    omniauth_callbacks: "sns_users/omniauth_callbacks"
  }

  #投稿関係
  resources :blogs do
    resources :comments
  end

  #ログイン関係
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
end
