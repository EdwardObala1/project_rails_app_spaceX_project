Rails.application.routes.draw do
  get 'home/index'
  get 'home/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/home/show', to: 'home#show'
  get 'home/launches/:page', to: 'home#launches', as: 'launches'
  get '/home/images', to: 'home#images'

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end
end
