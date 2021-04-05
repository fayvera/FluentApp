Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "static#home"
  resources :languages, param: :slug, except: [:new, :create, :edit, :update, :delete] do
    resources :calls, only: [:new, :create, :show]
  end

  resources :users, param: :slug  

  scope '/admin' do
    get '/', to: "static#admin", as: "/admin"
    get '/login', to: "sessions#new"
    get '/signup', to: "users#new"
    resources :languages, only: [:new, :create, :edit, :update, :delete]
    resources :users, param: :slug
  end
  get 'auth/:provider/callback', to: 'sessions#omniauth'


  get "/signin", to: "users#new"
  get '/login', to: "sessions#new" 
  post '/login', to: 'sessions#create' 
  get "/logout", to: "sessions#delete"  
    

end
