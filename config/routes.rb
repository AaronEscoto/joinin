Rails.application.routes.draw do
  resources :events, :only => [:show, :new, :create, :edit, :update, :destroy]
  resources :locations, :only => [:show, :new, :create, :edit, :update, :destroy]
  get 'locations/new'
  get 'events/new'
  

  devise_for :users
  get 'welcome/homepage'
  get 'welcome/matchmaking'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#homepage'

  devise_scope :user do
    delete "/users/logout" => "devise/sessions#destroy"
  end

end
