Rails.application.routes.draw do
  root "static#home"
  resources :languages
  resources :calls
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    # sessions
    get "/signin", to: "sessions#new"
    post "/session", to: "sessions#create"
    delete "/signout", to: "sessions#destroy"  
end
