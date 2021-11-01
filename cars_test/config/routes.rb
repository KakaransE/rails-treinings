Rails.application.routes.draw do
  
  root 'pages#home'

  get 'contacts', to: 'pages#contacts'
  get 'about', to: 'pages#about'


end
