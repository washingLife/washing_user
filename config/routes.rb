Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories, only: [:index, :show]

  resources :users do 
    collection do 
      put :change_current_city
    end
  end

  resources :user_addresses

  resources :addresses do 
    collection do 
      get :suggestion
    end
  end

  get '/home/user', to: 'home#user', as: 'user_home'

  root to: 'categories#index'
  mount ActionCable.server => '/cable' 
end
