Rails.application.routes.draw do
  get 'user_address/index'
  get 'user_address/new'
  post 'user_address/create'
  get 'user_address/:id/edit', to: 'user_address#edit', as: 'edit_user_address'
  patch 'user_address/update/:id', to: 'user_address#update'
  delete 'user_address/:id/destroy', to: 'user_address#destroy', as: 'destroy_user_address'
  get 'user_profile/edit'
  get 'user_profile/show', as: 'profile_show'
  post 'user_profile/create'
  patch 'user_profile/update'
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
