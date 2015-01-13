Rails.application.routes.draw do

  get 'auth/failure' => 'sessions#failure'
  get 'auth/:provider/callback' => 'sessions#create'
  # post 'auth/:provider/callback' => 'sessions#create'
  get 'auth/logout' => 'sessions#destroy', as: :auth_logout

  resources :gem_notes, path: :gems
  resources :gemfiles

  root 'home#index'

  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
