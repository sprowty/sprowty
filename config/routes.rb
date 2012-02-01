Sprowty::Application.routes.draw do

  resources :skills, :works, :keywords, :profiles
  resource :resume, :controller => "resumes"

  resources :problems
  resources :categories
  resources :messages
  resources :profiles
  resources :feedbacks
  resources :transactions
  match '/buycoins' => 'transactions#new', :as => :buy_coins

  match '/notify' => 'notifications#notify', :as => :notifications
  #root :to  => 'notifications#notify'

  resources :projects do
    get :inside
    get :approve
    get :cancel
    collection do
      get :dashboard
    end
    resources :problems
    resources :bids do
      get :accept
      get :reject
    end
  end

  match '/admin' => 'admin#index', :as => 'admin'

  match '/approve_work/:id' => 'works#approve', :as => 'approve_work'
  match '/approve_profile/:id' => 'profiles#approve', :as => 'approve_profile'

  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks" } do
    get 'login',  :to => 'devise/sessions#new'
    get 'logout', :to => 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :projects, :users
  end

  root :to                        => 'home#index'
  match 'inbox'                   => 'messages#index',  :as => 'inbox'
  match '/user'                   => 'profiles#index',  :as => :user_root # why are we doing this? rr
  match "/community"              => 'community#index'
  match '/community_project/:id'  => 'community#show', :as => :community_project
  match '/community_overview'     => 'community#overview', :as => :community_overview
  match '/contact'                => 'home#contact'
  match '/terms'                  => 'home#terms'
  match '/how_to'                 => 'home#how_to'
  match '/faq'                    => 'home#faq'
  match '/blog'                   => 'home#blog'
end
