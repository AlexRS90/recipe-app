Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/recipies', to: 'recipies#index', as: 'recipies'
  get '/recipies/new', to: 'recipies#new'
  post '/recipies/create', to: 'recipies#create', as: '/recipies/create'

  get '/recipies/:id/destroy', to: 'recipies#destroy', as: '/recipies/destroy'
  post '/recipies/:id/destroy', to: 'recipies#destroy'
    
  root "home#index"
end
