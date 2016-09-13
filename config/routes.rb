Rails.application.routes.draw do
  resources :pins
  devise_for :users
  root 'home#index'
  get '/about' => 'home#about'
  get '/project' => 'home#project'
end
