Rails.application.routes.draw do





  root to: "toppages#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  
  resources :communities
  resources :community_members, only: [:create, :destroy]
  
  
  
end
