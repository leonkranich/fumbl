Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teachers, only: [:index, :show, :new, :create]
  resources :teachers do
    resources :vouchers, only: [:create]
  end
  resources :timeslots, only: [:index, :update]
  resources :dashboards, only: [:index]
end
