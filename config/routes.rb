Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'product/index'
  get 'product/new'
  post 'product/create'
  get 'product/edit'
  get 'product/update'
  get 'product/destroy'
  get 'product/show'
  resources :user_addresses, except: [:show]
  resources :user_profile, except: [:new, :edit, :index, :create, :update, :show, :destroy] do
    collection do
        get 'edit', as: :edit
        get 'show', as: :show
        post 'create', as: :create
        patch 'update', as: :update
    end
  end
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
