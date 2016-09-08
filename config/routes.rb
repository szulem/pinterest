Rails.application.routes.draw do
  root 'home#index'
  get '/about' => 'home#about'
  get '/project' => 'home#project'
end
