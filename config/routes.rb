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




  get "fitness" => 'activities#fitness', as: 'fitness'
  get "nutrition" => 'activities#nutrition', as: 'nutrition'
  get "overall_health" => 'activities#overall_health', as: 'overall'
  get "wva_event" => 'activities#wva_event', as: 'wva_events'

  get "new_user_activity" => 'user_activities#new', as: 'new_user_activities'

  resources :prizes
  resources :activities
  resources :user_prizes



  root to: 'dashboards#index'

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
