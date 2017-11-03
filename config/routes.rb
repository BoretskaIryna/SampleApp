Rails.application.routes.draw do
  devise_for :customers, controllers: {
      sessions: 'customers/sessions',
      registrations: 'customers/registrations',
      confirmations: 'customers/confirmations'
  }

  devise_scope :customer do
    get "/customers" => "customers/customers#index"
    get "/customers/:id", to: "customers/customers#show", as: "customer"
    #get "/customer" => "customers/customers/#show"
    delete "/customers/:id", to: "customers/customers#destroy"
  end

  #get 'password_resets/new'
  #get 'password_resets/edit'


  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]



  root 'static_pages#home'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  #get 'sessions/new'

  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
