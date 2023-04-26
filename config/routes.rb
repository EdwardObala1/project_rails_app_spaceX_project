Rails.application.routes.draw do
  get 'home/index'
  get 'home/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/home/show', to: 'home#show'
  get 'home/videos', to: 'home#videos'
  get 'home/launches/:page', to: 'home#launches', as: 'launches'
  get '/home/images', to: 'home#images'

  post '/comment', to: 'comment#create', as: 'comments'
  patch '/comment/:id', to: 'comment#update', as: 'update_comment'
  delete '/comment/:id', to: 'comment#destroy', as: 'comment'

  post '/reply', to: 'reply#create', as: 'replies'
  patch '/reply/:id', to: 'reply#update', as: 'update_reply'
  delete '/reply/:id', to: 'reply#destroy', as: 'reply'

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end
end
