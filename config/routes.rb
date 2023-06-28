Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/delete'
  resource :bookings, only: [:create, :show, :update, :destroy]

  resources :admin do
    resources :bookings, only: [:index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
