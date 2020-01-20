Rails.application.routes.draw do
  root 'songs#index'
  resources :songs
  # , only: [:show, :new, :create, :edit, :update, :destroy]
end
