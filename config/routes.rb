Rails.application.routes.draw do
  root 'application#index'
<<<<<<< HEAD

  get 'suggestion/foursquare', to: 'foursquare#create_suggestion',
                                as: :foursquare_suggestion
=======
  get '/user/new', to: 'user#new', as: :new_user
  post '/user/new', to: 'user#create', as: :create_user
  get '/user/show', to: 'user#show', as: :show_user
>>>>>>> f354514673204c6a00c8992522d3153e807dddab
end
