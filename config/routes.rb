Rails.application.routes.draw do
  resources :ssl_checks
  resources :networkpages
  resources :sites
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'networkpages#index'
  get 'ssl', to:'ssl_checks#index'
  get 'sites', to:'sites#index'

end
