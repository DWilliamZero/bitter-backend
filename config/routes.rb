Rails.application.routes.draw do

  post '/auth/login', to: 'authentication#login'
  get '/auth/verify', to: 'authentication#verify'
  get '/follows/get-followers', to: 'follows#followers'
  get '/follows/get-following', to: 'follows#following'

  resources :follows
  resources :users do
    resources :posts do
      resources :hates
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
