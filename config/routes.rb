Rails.application.routes.draw do
  devise_for :users
  get 'welcome/homepage'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#homepage'

  devise_scope :user do
    delete "/users/sign_out" => "devise/sessions#destroy"
  end

end
