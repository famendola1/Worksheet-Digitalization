Rails.application.routes.draw do
  devise_for :admins
  get 'welcome/index'

  resources :students, param: :student_id
  
  resources :articles
  
  resources :quiz_results

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
