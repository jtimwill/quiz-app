Rails.application.routes.draw do
  root to: 'quizzes#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, except: [:index, :destroy]

  resources :quizzes, except: [:index, :destroy] do
    resources :user_quizzes, only: [:new, :create, :show, :index] 
  end
  
  resources :questions, only: [:index, :show, :new, :create]
  # resources :user_answers, only: [:new, :create]

end
