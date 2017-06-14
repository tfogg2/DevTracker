Rails.application.routes.draw do
  devise_for :users

  root to: 'home#home'
  resources :users, controller: 'users'
  resources :jobs, controller: 'jobs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
