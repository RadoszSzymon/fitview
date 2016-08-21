Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :workouts

  root 'workouts#index'
end
