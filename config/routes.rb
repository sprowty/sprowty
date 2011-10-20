Sprowty::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :skills, :works, :keywords, :profiles
  resource :resume, :controller => "resumes"

  resources :problems

  resources :messages

  resources :bids do
    get :accept
    get :reject
  end

  resources :feedbacks
  resources :payments
  match '/buycoins' => 'payments#new', :as => :buy_coins

  match '/ipn' => 'notifications#new', :as => :notifications

  resources :projects do
    get :inside
    get :approve
    get :cancel
    collection do
      get :dashboard
    end
    resources :problems
  end
  match '/approve_work/:id' => 'works#approve', :as => 'approve_work'
  match '/approve_profile/:id' => 'profiles#approve', :as => 'approve_profile'

  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks" } do
    get 'login',  :to => 'devise/sessions#new'
    get 'logout', :to => 'devise/sessions#destroy'
  end

  root :to                        => 'home#index'
  match 'inbox'                   => 'messages#index',  :as => 'inbox'
  match '/user'                   => 'profiles#index',  :as => :user_root
  match "/community"              => 'community#index'
  match '/community_project/:id'  => 'community#show', :as => :community_project
  match '/community_overview'     => 'community#overview', :as => :community_overview
  match '/contact'                => 'home#contact'
  match '/terms'                  => 'home#terms'
  match '/how_to'                 => 'home#how_to'
  match '/faq'                    => 'home#faq'
  match '/blog'                   => 'home#blog'
end
