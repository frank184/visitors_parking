Rails.application.routes.draw do

  root 'visitors_parking_pages#index'
  
  get 'about'   => 'visitors_parking_pages#about'
  get 'contact' => 'visitors_parking_pages#contact'
  get 'help'    => 'visitors_parking_pages#help'
end
