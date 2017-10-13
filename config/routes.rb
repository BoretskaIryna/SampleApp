Rails.application.routes.draw do


  get 'user/new'

  root 'static_pages#home'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'user#new'
  get   '/show',   to: 'user#show' # url/show?id=1      only!!!
  resources  :users
end
