Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#welcome'
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/sessions/homepage' => 'sessions#homepage'
   

  
  resources :users, except: [:index] 
  resources :users do
    resources :comments, shallow: true   
    resources :family_histories, shallow: true 
    resources :immunizations, shallow: true 
    resources :medications, shallow: true 
    resources :subjectives, shallow: true 
    resources :surgeries, shallow: true 
  end
  resources :sessions

  resources :comments, only: [:index, :new, :create, :edit]  
  resources :family_histories, only: [:index, :new, :create, :edit]
  resources :immunizations, only: [:index, :new, :create, :edit]  
  resources :medications, only: [:index, :new, :create, :edit]  
  resources :subjectives, only: [:index, :new, :create, :edit]
  resources :surgeries, only: [:index, :new, :create, :edit]

  
   
   
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
