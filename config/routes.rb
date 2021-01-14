Rails.application.routes.draw do
  devise_for :users
  get 'webtypes/index'
  root to: "webtypes#index"
  resources :webtypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create 
  end
end
