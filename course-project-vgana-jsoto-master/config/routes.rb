Rails.application.routes.draw do
  devise_for :users
  resources :mailbox
  resources :messages
  resources :reviews
  resources :stays
  resources :users
  resources :lodgings
  resources :search
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"

  resources :users do
    resources :lodgings, shallow: true
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :lodgings
      resources :users do
        resources :lodgings
      end
    end
  end

end
