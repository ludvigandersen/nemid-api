Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :genders
  resources :users

  get '/authenticate', to: 'users#authenticate'
  post '/change-password', to: 'users#change_password'
  post '/reset-password', to: 'users#reset_password'
end
