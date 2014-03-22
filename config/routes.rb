TextAdvApp::Application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'scenes/link/:origin_id' => 'scenes#new_link', :as => :link_scene
  post 'scenes/link/:origin_id' => 'scenes#create_link'

  resources :adventures, :scenes
  
end
