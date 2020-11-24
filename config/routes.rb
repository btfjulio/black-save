Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offers, only: %i(index show)


  devise_scope :user do
    authenticated :user do
      root 'rails_admin/main#dashboard', as: :authenticated_root
    end
    
    unauthenticated do
      root 'offers#index', as: :unauthenticated_root
    end
  end

end
