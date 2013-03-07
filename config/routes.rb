Dashboard::Application.routes.draw do

  root :to => 'profiles#show'
  resources :profiles
  resources :sites

  devise_for :users,
             :path_names => {:sign_in => "login", :sign_out => "logout", :sign_up => "register"},
             :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  match 'github/authorize', :to => 'github#authorize'
  match 'github/callback', :to => 'github#callback'
  match 'github/success', :to => 'github#success'
  match 'github/profile', :to => 'github#profile'

  match 'linkedin/index', :to => 'linked_in#index'
  match 'linkedin/callback', :to => 'linked_in#callback'
  match 'linkedin/success', :to => 'linked_in#success'

  match 'stack_overflow/add', :to => 'stack_overflow#add'
  post 'stack_overflow/create', :to => 'stack_overflow#create'
  match 'stack_overflow/stats', :to => 'stack_overflow#populate_stats'

  match 'feeds/add', :to => 'feeds#add'
  post 'feeds/create', :to => 'feeds#create'
  match 'feeds/stats', :to => 'feeds#stats'

  match ':username/profile', :to => 'profiles#show', :as => 'friendly_profile'
  match ':username', :to => 'walls#index', :as => 'friendly_wall'
end
