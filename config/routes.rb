Rails.application.routes.draw do
  resources :colorselections
  devise_for :users
  resources :ssl_checks #, only: [:index]
  resources :networkpages#, only: [:index]
  resources :colorselection
  resources :search
  root 'public_html#index'
  resources :sites
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'ssl', to:'ssl_checks#index'
  get 'sites', to:'sites#index'
  
  
end
