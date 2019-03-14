Rails.application.routes.draw do
  resources :departments
  resources :works
  get 'exports/main'
  get 'exports/export'
  post 'exports/export'
  resources :projects
  get 'dash/index'
  devise_for :users, controllers: { omniauth_callbacks: 'user/omniauth_callbacks',:registrations => 'user/registrations' }
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
