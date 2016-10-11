Rails.application.routes.draw do
  resources :pins
  devise_for :users
  root 'pins#index'
  get '/about' => 'home#about'
  get '/project' => 'home#project'
  get '/mypins' => 'pins#mypins'
  #get '/userpin' => 'pins#userpin'
  get '/userpin/:user' => 'pins#userpin', as: :user_pins
end
