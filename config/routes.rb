Rails.application.routes.draw do
  #投稿関係
  resources :blogs do
    resources :comments
  end

  #ログイン関係
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
end
