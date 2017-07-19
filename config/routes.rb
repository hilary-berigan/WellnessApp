Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :activities
  resources :prizes
  resources :user_activities


   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
