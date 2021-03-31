Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "static#home"
  resources :languages, param: :slug, only: [:show, :index]
  # get '/languages/#{slug}', to: "languages#show"
  resources :calls
  resources :users  

  scope '/admin' do
    resources :languages, only: [:new, :create, :edit, :update, :delete]
  end

  get "/signin", to: "users#new"
  # post "/signin", to: "users#create"
  get '/login', to: "sessions#new"  
  get "/logout", to: "sessions#delete"  
    
    resources :user_languages

end
