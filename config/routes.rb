TextAdvApp::Application.routes.draw do
  devise_for :users

  root 'home#index', :as => :home
  get '/guide' => 'home#guide'

  #adventure routes
  resources :adventures

  #scene routes
  resources :scenes

  #path routes
  resources :tracks, :only => [:create,:destroy]
  
end
