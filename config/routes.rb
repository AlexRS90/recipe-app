Rails.application.routes.draw do
  get 'recipies/index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :recipies, only: [:index]
    
  root "home#index"
end
