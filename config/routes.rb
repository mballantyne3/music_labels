Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/artists', to: 'artists#index'
  get '/artists/:id', to: 'artists#show'
  get '/artists/:id/edit', to: 'artists#edit'
  patch '/artists/:id', to: 'artists#update'
  get '/record_labels', to: 'record_labels#index'
  get '/record_labels/new', to: 'record_labels#new'
  post '/record_labels', to: 'record_labels#create'
  get '/record_labels/:id', to: 'record_labels#show'
  get '/record_labels/:id/artists', to: 'record_labels_artists#index'
  get '/record_labels/:id/edit', to: 'record_labels#edit'
  patch '/record_labels/:id', to: 'record_labels#update'
  get '/record_labels/:id/artists/new', to: 'record_labels_artists#new'
  post 'record_labels/:id/artists', to: 'record_labels_artists#create'
end
