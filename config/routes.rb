Dashboard::Application.routes.draw do
  root :to => redirect("/users/login")
  devise_for :users,
             :path_names => {:sign_in => "login", :sign_out => "logout", :sign_up => "register"},
             :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
end
