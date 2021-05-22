Rails.application.routes.draw do

  post 'register', to: 'users#create'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  defaults format: :json do
    resources :posts
  end

end
