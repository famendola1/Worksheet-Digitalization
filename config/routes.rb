Rails.application.routes.draw do
  devise_for :admins
  
  authenticated :admin do
    root 'admins#show'
  end
  
  root 'students#index'
  
  # Routing for students and quiz result requests
  resources :students, except: [:new, :create] do
    resources :quiz_results, except: [:index]
  end
  
  resources :admins, only: [:show] do
    resources :courses, except: [:index] do
      resources :students, only: [:new, :create] do
        collection {post :import}
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
