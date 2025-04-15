Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource :registration, only: [:new, :create]
  
  # Welcome page for authenticated users
  get 'welcome', to: 'welcome#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # For authenticated users, show welcome page
  constraints AuthenticationConstraint.authenticated do
    root to: "welcome#index", as: :authenticated_root
  end
  
  # For unauthenticated users, show login page
  constraints AuthenticationConstraint.unauthenticated do
    root to: "sessions#new", as: :unauthenticated_root
  end
end
