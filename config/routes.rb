Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/artists', to: 'artists#index'
  get '/artists/:id', to: 'artists#show'
  get '/record_labels', to: 'record_labels#index'
  get '/record_labels/:id', to: 'record_labels#show'
  get '/record_labels/:id/artists', to: 'record_labels_artists#index'
end
