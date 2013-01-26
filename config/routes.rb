Dashboard::Application.routes.draw do
  root :to => 'sites#index'
  resources :sites

  devise_for :users,
             :path_names => {:sign_in => "login", :sign_out => "logout", :sign_up => "register"},
             :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  match 'github/authorize', :to => 'github#authorize'
  match 'github/callback', :to => 'github#callback'
  match 'github/success', :to => 'github#success'
  match 'github/profile', :to => 'github#profile'
end
