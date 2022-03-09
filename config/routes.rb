Rails.application.routes.draw do
  get 'public_recipe/public_recipies'
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

  resources :foods, except: %i[edit, update]

  # resources :public_recipes, only: %i[index, show]
  get '/public_recipes', to: 'public_recipes#index'
end
