Rails.application.routes.draw do

  resources :posts do
    member do
      get :follow
      get :unfollow
    end
  end

  match "/posts/new_comment" => "posts#new_comment", :as => "new_comment_to_posts", :via => [:post]

  resources :comments
  devise_for :users
    get 'welcome/homepage'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#homepage'

  devise_scope :user do
    delete "/users/logout" => "devise/sessions#destroy"
  end

end
