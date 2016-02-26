Rails.application.routes.draw do
  devise_for :users
  root 'docs#index'
  resources :projects do
    resources :tasks, :except => [:show]
  end
end
