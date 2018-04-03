Rails.application.routes.draw do

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  get 'admin/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resources :orders
  resources :buy_items
  resources :carts
  root 'store#index', as: 'store_index'

  resources :items do
    get :who_bought, on: :member
  end

  get '*path' => 'store#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
