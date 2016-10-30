Rails.application.routes.draw do
  devise_for :users

  scope "/admin" do
 	  resources :users
  end

  resources :publications
  
  root to: 'publications#index'

  get '*path', to: redirect('/')

end
