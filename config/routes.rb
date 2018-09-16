Rails.application.routes.draw do
  get 'relationships/create'

  get 'relationships/destroy'

  #投稿関係
  resources :blogs do
    resources :comments
  end

  #ログイン関係
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create, :show, :edit, :update]

  #ユーザーフォロー関係
  resources :relationships, only: [:create, :destroy]
end
