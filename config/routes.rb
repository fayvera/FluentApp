Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # sessions
  
  root "static#home"
  resources :languages, param: :slug, only: [:show, :index]
  # get '/languages/#{slug}', to: "languages#show"
  resources :calls
  resources :users  
  scope '/admin' do
    resources :languages, only: [:new, :create, :edit, :update, :delete]
  end

  get "/signin", to: "sessions#new"
  post "/session", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"  
  # get '/login', to:   
    
    resources :user_languages

end
