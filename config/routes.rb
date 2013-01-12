Dashboard::Application.routes.draw do
  root :to => 'sessions#new'
  match "/auth/google_oauth2/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#failure"
  match "/logout", to: "sessions#destroy", :as => "logout"

  resources :users
  get '/:user_name' => 'users#show', :as => 'vanity_url'
end
