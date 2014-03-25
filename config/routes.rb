TextAdvApp::Application.routes.draw do
  devise_for :users

  root 'home#index', :as => :home
  get '/guide' => 'home#guide'

  #adventure routes
  get '/adventures/my_creations' => 'adventures#my_creations', :as => :my_creations
  resources :adventures

  #scene routes
  resources :scenes, :except => [:index]

  #path routes
  resources :tracks, :only => [:create,:destroy]
  
end
