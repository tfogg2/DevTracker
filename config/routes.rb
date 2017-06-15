Rails.application.routes.draw do
  devise_for :users

  root to: 'home#home'
  resources :users, controller: 'users'
  resources :projects, controller: 'projects'
  resources :steps, controller: 'steps'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
