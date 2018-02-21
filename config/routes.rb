Rails.application.routes.draw do

  get '/stories/' => 'stories#index'
  get '/stories/:id' => 'stories#show'

end
