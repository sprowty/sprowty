Sprowty::Application.routes.draw do

  resources :projects

  resources :messages

  # Authentication
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get 'login',  :to => 'devise/sessions#new'
    get 'logout', :to => 'devise/sessions#destroy'
  end

  root :to => 'home#index'
  match 'inbox' => 'messages#index', :as => 'inbox'
end
