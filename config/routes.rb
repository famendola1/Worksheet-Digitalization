Rails.application.routes.draw do
  devise_for :admins
  get 'welcome/index'

  resources :students do 
    resources :quiz_results
  end
  
  # scope 'students/:student_id' do
    # resources :quiz_results
  # end
  
  resources :articles
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
