Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/recipies/:id/shopping_list', to: 'shopping_list#index'
  get 'public_recipe/public_recipies'

  get '/recipies', to: 'recipies#index', as: 'recipies'
  get '/recipies/new', to: 'recipies#new'
  get '/recipies/:id', to: 'recipies#show', as: 'recipe'
  post '/recipies/create', to: 'recipies#create', as: '/recipies/create'

  get '/inventory', to: 'inventory#index'
  post '/inventory/create', to: 'inventory#create'

  get '/inventory/:inventory_id', to: 'inventory#show'
  post '/inventory/:inventory_id', to: 'inventory#populate_inventory'

  get '/inventory/:inventory_id/destroy', to: 'inventory#destroy'
  delete '/inventory/:inventory_id/destroy', to: 'inventory#destroy'

  get '/inventory/:inventory_id/:inv_food_id/destroy', to: 'inventory#destroy_populate'
  post '/inventory/:inventory_id/:inv_food_id/destroy', to: 'inventory#destroy_populate'

  get '/recipies/:id/ingredients/new', to: 'ingredients#new'
  post '/recipies/:id/ingredients/create', to: 'ingredients#create'

  get '/recipies/:id/ingredients/:ingredient_id/destroy', to: 'ingredients#destroy'
  post '/recipies/:id/ingredients/:ingredient_id/destroy', to: 'ingredients#destroy'

  get '/recipies/:id/destroy', to: 'recipies#destroy', as: '/recipies/destroy'
  delete '/recipies/:id/destroy', to: 'recipies#destroy'
    
  root "home#index"

  resources :foods, except: %i[edit, update]

  # resources :public_recipes, only: %i[index, show]
  get '/public_recipes', to: 'public_recipes#index'
end
