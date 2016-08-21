Rails.application.routes.draw do
  get 'info/about'
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :workouts

  root 'workouts#index'
end
