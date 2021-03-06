Rails.application.routes.draw do

  post '/auth/login', to: 'authentication#login'
  get '/auth/verify', to: 'authentication#verify'

  get '/follows', to: 'follows#all'
  post '/follows', to: 'follows#create'
  delete '/unfollow', to: 'follows#destroy'

  get '/hates', to: 'hates#all'

  resources :users do
    get '/followers', to: 'follows#followers'
    get '/following', to: 'follows#following'
    resources :posts do
      delete '/hates', to: 'hates#destroy'
      resources :hates
    end
  end
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
