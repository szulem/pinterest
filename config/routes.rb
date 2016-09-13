Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/about' => 'home#about'
  get '/project' => 'home#project'
end
