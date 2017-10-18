Rails.application.routes.draw do

  get 'test_html/index'

  resources :dashboards

  devise_for :users

  resources :users do
    resources :user_activities, except: [:create, :new]
    resources :user_prizes
  end

  resources :activities do
    resources :user_activities, only: [:create, :new]
  end



  get "self" => 'activities#self', as: 'self'
  get "train" => 'activities#train', as: 'train'
  get "responsibility" => 'activities#responsibility', as: 'responsibility'
  get "opportunities" => 'activities#opportunities', as: 'opportunities'
  get "numbers" => 'activities#numbers', as: 'numbers'
  get "goals" => 'activities#goals', as: 'goals'
  get "new_user_activity" => 'user_activities#new', as: 'new_user_activities'

  resources :prizes
  resources :activities


  namespace :admin do
    resources :prizes
    resources :activities 
    resources :users 
  end


  root to: 'dashboards#index'

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
