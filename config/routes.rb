TextAdvApp::Application.routes.draw do
  devise_for :users

  root 'home#index', :as => :home

  resources :adventures

  resources :scenes, :only => [:index, :show, :edit, :update, :destroy]
  get 'scenes/new/:origin_id' => 'scenes#new', :as => :new_scene
  post 'scenes/:origin_id' => 'scenes#create'
  
end
