Rails.application.routes.draw do
  root 'facelooks#index'
  #resources :facelooks


  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  resources :demos, only: [:new, :create, :show] do 
    member do 
      get :new_sub_demo
      post :create_sub_demo
    end
  end

  resources :posts, only: [:new, :create, :show] do
     member do 
      get :new_comment
      post :create_comment
    end
  end

  resources :students, only: [:new, :create, :show]
  resources :projects, only: [:new, :create, :show]

end
