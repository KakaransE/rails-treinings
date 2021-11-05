Rails.application.routes.draw do
  
  root 'pages#home'

  get 'contacts', to: 'pages#contacts'
  get 'about', to: 'pages#about'

  get 'search', to: 'cars#search' 
  get 'list', to: 'cars#list'
  get 'data', to: 'cars#data'
  get 'distinct', to: 'cars#distinct'

  resources :cars

end
