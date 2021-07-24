Rails.application.routes.draw do
  get 'users/show'
  get 'registered_projects/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'tops#index'
  devise_for :users
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations'
  # }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  resources :homes, only: [:index]
  resources :products do
    resources :product_contacts
  end
  resources :customers
  resources :registered_projects, only: [:index]
  resources :user_products, only: %i[create destroy]
  resources :user_customers, only: %i[create destroy]
  resources :users, only: [:show]
end
