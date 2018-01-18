Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  
  get "/deals" => "daily_deals#index"
  get "/deals2" => "daily_deals#index2"
  get "/deals_search" => "daily_deals#search"
  post "/deals" => "daily_deals#create"
  get "/deals/:id" => "daily_deals#show"
  patch "/deals/:id" => "daily_deals#update"
  delete "/deals/:id" => "daily_deals#destroy"

  get "/lists" => "wish_lists#index"
  get "/images" => "wish_lists#image"

  post "/lists" => "wish_lists#create"
  get "/lists/:id" => "wish_lists#show"
  patch "/lists/:id" => "wish_lists#update"
  delete "/lists/:id" => "wish_lists#destroy"

  post "/users" => "users#create"


end
