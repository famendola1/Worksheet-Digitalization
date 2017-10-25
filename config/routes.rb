Rails.application.routes.draw do
  devise_for :admins
  root 'welcome#index'
  get 'welcome/index'

  # Routing for students and quiz result requests
  resources :students do 
    resources :quiz_results
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
