Rails.application.routes.draw do

  get 'auth/failure' => 'sessions#failure'
  get 'auth/:provider/callback' => 'sessions#create'
  # post 'auth/:provider/callback' => 'sessions#create'
  get 'auth/logout' => 'sessions#destroy', as: :auth_logout

  resources :gem_notes

  root 'home#index'
end
