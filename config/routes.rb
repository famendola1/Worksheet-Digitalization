Rails.application.routes.draw do
  devise_for :admins
  
  authenticated :admin do
    root 'admins#show'
  end
  
  root 'students#index'
  
  # Routing for students and quiz result requests
  resources :students do 
    resources :quiz_results
  end
  
  resources :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
