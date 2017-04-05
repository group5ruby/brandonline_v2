Rails.application.routes.draw do
  devise_for :admins, controllers: {
        sessions: 'admins/sessions'               
      } 

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        omniauth_callbacks: "users/omniauth_callbacks",
        registrations: 'users/registrations'
      }  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "feed" => "users#feed"
  get "control" => "admins#control"
  get "profile" => "users#profile"
  get "eprofile" => "admins#eprofile"  
  resources :bank_accounts  
  resources :users do
    resources :feedbacks
    resources :requests
  end
  resources :requests do
    put :handled
  end 
  resources :feedbacks do
    put :accepted   
  end
  resources :follows
  root "home#welcome"  

  
end
