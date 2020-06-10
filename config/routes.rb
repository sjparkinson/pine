# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'index#index'

  get 'healthz', to: 'index#healthz'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'join', to: 'users#new', as: 'join'

  resources :users, only: %i[new create]
  resources :trees

  delete '/trees/:id/image/:image_id', to: 'trees#destroy_attachment', as: 'tree_attachment'

  # Handle error pages.
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "index#error", :code => code
  end
end
