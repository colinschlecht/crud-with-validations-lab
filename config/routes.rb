Rails.application.routes.draw do
  resources :songs
  get '/', to: 'songs#index', as: 'songs_index'

end
