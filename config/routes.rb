Rails.application.routes.draw do
  devise_for :users

  root to: 'home#home'
  resources :users
  resources :projects, param: :share_token do
    resources :steps
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
