Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # sessions
  
  root "static#home"
  resources :languages, param: :slug
  # get '/languages/#{slug}', to: "languages#show"
  resources :calls
  resources :users  
    # resources :admin

  get "/signin", to: "sessions#new"
    post "/session", to: "sessions#create"
    delete "/signout", to: "sessions#destroy"  
    
    
    resources :user_languages

end
