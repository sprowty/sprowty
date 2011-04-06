Sprowty::Application.routes.draw do
  # Authentication
  devise_for :users do
    get 'login',  :to => 'devise/sessions#new'
    get 'logout', :to => 'devise/sessions#destroy'
  end

  root :to => 'home#index'
end
