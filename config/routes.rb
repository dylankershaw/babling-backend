Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :chats, only: [:index, :show, :create, :update]
      resources :messages, only: [:index, :show, :create, :update]
      resources :translations, only: [:index, :show, :create, :update]
    end
  end
end
