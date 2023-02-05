Rails.application.routes.draw do
  get 'user_profile/add'
  get 'user_profile/edit'
  get 'user_profile/show', as: 'profile_show'
  post 'user_profile/create'
  patch 'user_profile/update'
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
