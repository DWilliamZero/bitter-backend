Rails.application.routes.draw do

  post '/auth/login', to: 'authentication#login'
  get '/auth/verify', to: 'authentication#verify'

  get '/followers', to: 'follows#followers'
  get '/following', to: 'follows#following'
  post '/follow', to: 'follows#create'
  delete '/unfollow', to: 'follows#destroy'

  resources :users do
    resources :posts do
      resources :hates
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
