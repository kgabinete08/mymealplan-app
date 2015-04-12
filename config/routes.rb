MykitchenApp::Application.routes.draw do
  root to: 'recipes#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :recipes, except: [:destroy] do
    resources :comments, only: [:create]
    member do
      post :vote
    end
  end
  resources :meal_plans
  resources :users, except: [:destroy]

end
