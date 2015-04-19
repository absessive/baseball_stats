Rails.application.routes.draw do

  get 'years/upload'

  devise_for :users
  root to: "home#index"

  resources :players
  resource :years

end
