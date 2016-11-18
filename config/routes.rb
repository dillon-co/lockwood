Rails.application.routes.draw do
  
  resources :tags
  resources :blogs
  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  root 'pages#home'

  devise_for :admins, controllers: { sessions: 'admins/sessions' }, path_names: { sign_up: nil }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
