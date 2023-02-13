Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'user_address/index'
  get 'user_address/new'
  post 'user_address/create'
  get 'user_address/:id/edit', to: 'user_address#edit', as: 'edit_user_address'
  patch 'user_address/update/:id', to: 'user_address#update'
  delete 'user_address/:id/destroy', to: 'user_address#destroy', as: 'destroy_user_address'
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
