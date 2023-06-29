Rails.application.routes.draw do
  root to: 'welcome#home'
  get 'admin/bookings', to: 'admin#index'
  
  resources :bookings, except: [:index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
