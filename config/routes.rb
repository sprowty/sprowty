Sprowty::Application.routes.draw do
  
  resources :messages, :projects, :skills, :bids, :works
  
  
  
  resource :profile, :controller => "profiles"
  
  resources :profiles, :only => :show

  resources :projects do
    collection do
      get :dashboard
    end
  end

  # Authentication
  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks" } do
    get 'login',  :to => 'devise/sessions#new'
    get 'logout', :to => 'devise/sessions#destroy'
  end

  root :to => 'home#index'
  match 'inbox'          => 'messages#index',  :as => 'inbox'
  #match 'profile'       => 'profiles#index',  :as => 'my_profile'
  #match 'profile/edit'  => 'profiles#edit',   :as => 'edit_profile'
  #match 'profile/:id'   => 'profiles#show',   :as => 'profile'
  match '/user'          => 'profiles#index',  :as => :user_root
  match "/community"     => 'community#index'
end
