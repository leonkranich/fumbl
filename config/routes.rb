Rails.application.routes.draw do
  get 'bookings/new'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teachers, only: [:index, :show, :new, :create]
  resources :teachers do
    resources :vouchers, only: [:new, :create]
    resources :bookings, only: :new
  end

  resources :availabilities do
    resources :timeslots, only: :edit
  end
  resources :timeslots, only: :update
  resources :dashboards, only: :index
  resources :search, only: [:index]
  get "download_homework", to: 'dashboards#download'



  patch 'availabilities_timeslots', to: 'availabilities#update_associated_timeslots', as: "update_associated_timeslots"
end
