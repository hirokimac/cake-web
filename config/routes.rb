Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get :quit
      delete :withdrawal
      get :withdrawal_updata

      resources :carts, only: [:create, :index, :update, :destroy] do
        collection do
          delete :destroy_all
        end
      end
    
      resources :orders, only: [:new, :create, :index, :show] do
        collection do
          get :order_check
          get :thanks
        end
        member do
          resource :order_items, only: [:create]
        end
      end

      resources :delivery_addresses, only: [:index, :create, :edit, :update, :destroy]

      get 'cart_items' => 'cart_items#destroy_all'
      
    end
    
  end

  resources :products, only: [:show, :index] 

  get 'about' => 'homes#about'
  
  root 'homes#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  
end
