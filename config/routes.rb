Rails.application.routes.draw do
  devise_for :users
  resources :vehicles

  authenticated :user do
    root :to => 'vehicles#index', :as => 'authenticated_root'
  end

  root :to => 'visitors_parking_pages#index'

  # visitors_parking_pages
  get 'home'    => 'visitors_parking_pages#index'
  get 'about'   => 'visitors_parking_pages#about'
  get 'contact' => 'visitors_parking_pages#contact'
  get 'help'    => 'visitors_parking_pages#help'

end
