Rails.application.routes.draw do
  root 'application#index'

  get 'suggestion/foursquare', to: 'foursquare#create_suggestion',
                                as: :foursquare_suggestion
end
