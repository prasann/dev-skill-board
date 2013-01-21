Dashboard::Application.routes.draw do
  root :to => 'sessions#new'
  devise_for :users, :path_names => {:sign_in => "login", :sign_out => "logout", :sign_up => "register"}, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
end
