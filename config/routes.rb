Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "static#home"
  resources :languages, param: :slug, except: [:new, :create, :edit, :update, :delete] do
    resources :calls, only: [:new, :create, :show]
  end

  resources :users, param: :slug  

  scope '/admin' do
    resources :languages, only: [:new, :create, :edit, :update, :delete]
    resources :users, param: :slug
    # get '/admin/login', to "sessions#new"
    # get '/admin/signup', to "users#new"
  end
  get 'auth/:provider/callback', to: 'sessions#omniauth'


  get "/signin", to: "users#new"
  # post "/signin", to: "users#create"
  get '/login', to: "sessions#new" 
  post '/login', to: 'sessions#create' 
  get "/logout", to: "sessions#delete"  
    
    # resources :user_languages

end
