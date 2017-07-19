Rails.application.routes.draw do
  devise_for :users

  root to: 'home#home'
  resources :users
  resources :projects do
    # collection do
    #   # get :search
    #   # match '/search', to: "projects#search", via: "post"
    # end
    resources :project_invites
    resources :conversations do
      get :selected, to: 'conversations#selected'
    end
    resources :steps
  end
  resources :messages

  get '/search', to: 'projects#search'

  get "/join", to: 'project_invites#join', as: 'join_project'


  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
