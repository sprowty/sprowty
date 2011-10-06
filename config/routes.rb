Sprowty::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :messages, :projects, :skills, :bids, :works, :keywords
  resource :profile#, :controller => "profiles"
  resource :resume, :controller => "resumes"
  resources :profiles#, :only => :show

  resources :payments
  match '/buycoins' => 'payments#new', :as => :buy_coins

  resources :projects do
    get :inside
    get :approve
    collection do
      get :dashboard
    end
  end
  match '/approve_work/:id' => 'works#approve', :as => 'approve_work'
  match '/approve_profile/:id' => 'profiles#approve', :as => 'approve_profile'

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
  match '/community_project/:id' => 'community#show', :as => :community_project
  match '/community_overview' => 'community#overview', :as => :community_overview
end
