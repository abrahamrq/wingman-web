Rails.application.routes.draw do
  root 'application#index'
  get '/user/new', to: 'user#new', as: :new_user
  post '/user/new', to: 'user#create', as: :create_user
  get '/user/show', to: 'user#show', as: :show_user
  get '/dateplan', to: 'dateplan#show', as: :dateplan
end
