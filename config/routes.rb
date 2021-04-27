Rails.application.routes.draw do
  root to: "home#index"
  resources :articles
  resources :sessions
  resources :users do
  	member do
      get :confirm_email
      get :forget_password
      patch :update_password
    end
  end
  get "create", to: "sessions#create", as: :create_session
  get "forget_password_mail", to: "users#forget_password_mail"
  post :notification, to: 'notification#send'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
