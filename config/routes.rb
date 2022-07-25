Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root "pages#home"

  get "search", to: "search#index"

  resources :users, only: :show

  resources :rooms

  resources :rooms do
    member do
      get :listing, :price, :description, :amenities, :location, :photoes
      delete :delete_photo
      patch :update_is_published
    end
  end

  resources :reservations do
    resources :reviews, only: [:create, :update, :new, :edit]
  end

  get "/your_reservations", to: "reservations#your_reservations"
  get "/your_trips", to: "reservations#your_trips"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
