Rails.application.routes.draw do
 
  resources :userlists


  

  get "search" => "search#show"
  root :to => "sessions#new"
  get "participate" => "groups#participate"

  controller :sessions do
    
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
    
  end
  resources :users
  
  resources :groups
  controller :groups do
    get "created" => :created
    get "groups/show" => :show
    get "regist"=>:participate
  end

  get "groups/show/:id" => "groups#show"
  controller :homes do
    get "home" => :top
  end
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
