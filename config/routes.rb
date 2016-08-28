Rails.application.routes.draw do
  # Root route
  root 'application#index'

  # Session routes
  post 'login', to: 'sessions#create', as: :login
  get 'logout', to: 'sessions#destroy', as: :destroy_session

  # Foursquare routes
  get 'suggestion/foursquare', to: 'foursquare#create_suggestion',
                               as: :foursquare_suggestion,
                               default: { format: 'js' }
  # User routes
  get '/user/new', to: 'user#new', as: :new_user
  post '/user/new', to: 'user#create', as: :create_user
  get '/user/show', to: 'user#show', as: :show_user
  patch 'user/update', to: 'user#update', as: :update_user
  
  #DatePlans routes
  get '/dateplan', to: 'dateplan#show', as: :dateplan

  resources :dateplan
end