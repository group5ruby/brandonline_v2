Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        omniauth_callbacks: "users/omniauth_callbacks",
        registrations: 'users/registrations'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "feed" => "users#feed"
  resources :users
  root "home#index" 
end
