Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [] do
    member do
      get :change_booking_status
    end
  end
  resources :books do
    resources :bookings, only: %i[create]
  end
end
