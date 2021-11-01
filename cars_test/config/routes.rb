Rails.application.routes.draw do
  
  root 'pages#home'

  get 'contacts', to: 'pages#contacts'
  get 'about', to: 'pages#about'

  get 'search', to: 'cars#search' 
  get 'list', to: 'cars#list'

  resources :cars

end
