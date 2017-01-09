Rails.application.routes.draw do
  
  resources :invoices
  resources :services
  resources :products
  get 'products/lookup' => 'products#lookup', as: :lookup
  devise_for :clients
  resources :site_styles

  resources :tags
  resources :blogs
  get 'pages/home'

  get 'pages/landing' => 'pages#landing'

  get 'pages/about'

  get 'pages/contact'

  get 'admin/dashboard' => 'pages#dashboard', as: :dashboard

  root 'pages#landing'

  devise_for :admins, controllers: { sessions: 'admins/sessions' }, path_names: { sign_up: nil }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
