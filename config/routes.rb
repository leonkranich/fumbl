Rails.application.routes.draw do
  get 'bookings/new'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teachers, only: [:index, :show, :new, :create]
  resources :teachers do
    resources :vouchers, only: [:new, :create]
  end
  resources :teacher do
    resources :availabilities, only: :index
  end
  resources :availabilities do
    resources :timeslots, only: :edit
    resources :bookings, only: :new
  end
  resources :timeslots, only: :update
  resources :dashboards, only: :index


  patch 'availabilities_timeslots', to: 'availabilities#update_timeslots', as: "update_associated_timeslots"
  get 'bookings_nextday', to: 'bookings#next_day', as: 'next_day'
end
