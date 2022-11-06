Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :users, only: [:show]
  get "/users/:user_id/items", to: "items#index"
  get "/users/:user_id/items/:id", to: "items#show"
  post "/users/:user_id/items", to: "items#create"
end
