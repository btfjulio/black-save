Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :offers, only: %i(index new create edit update destroy)
  end

  resources :offers, only: %i(index show)

  root to: 'admin/offers#index'
end
