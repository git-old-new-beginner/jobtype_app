Rails.application.routes.draw do
  devise_for :users
  get 'webtypes/index'
 root to: "webtypes#index"
end
