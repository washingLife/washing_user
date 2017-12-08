Rails.application.routes.draw do
  resources :user_addresses
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do 
    collection do 
      put :change_current_city
    end
  end

  resources :categories, only: [:index, :show]

  resources :messages, only: [:index]

  resources :orders do 
  end

  get '/home/user', to: 'home#user', as: 'user_home'

  root to: 'categories#index'

  resources :addresses do 
    collection do 
      get :suggestion
    end
  end

  mount ActionCable.server => '/cable' 
end
