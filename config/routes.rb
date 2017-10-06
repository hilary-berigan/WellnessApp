Rails.application.routes.draw do

  get 'test_html/index'

  resources :dashboards
  devise_for :users

  resources :activities

  get "fitness" => 'activities#fitness', as: 'fitness'
  get "nutrition" => 'activities#nutrition', as: 'nutrition'
  get "overall_health" => 'activities#overall_health', as: 'overall'

  resources :prizes
  resources :user_activities
  resources :user_prizes


  root to: 'dashboards#index'

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
