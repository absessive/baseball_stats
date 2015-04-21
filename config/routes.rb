Rails.application.routes.draw do

  get 'years/upload'

  devise_for :users
  root to: "home#index"

  resources :players, only: [:index]
  resource :years, only: [:index, :new, :create]

end
