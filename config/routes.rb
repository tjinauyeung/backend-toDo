Rails.application.routes.draw do
  root 'docs#index'
  resources :projects do
    resources :tasks, :except => [:show]
  end
end
