Rails.application.routes.draw do
  devise_for :users
  resources :publications
  root to: 'publications#index'
end
