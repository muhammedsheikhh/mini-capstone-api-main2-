Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/reports" => "reports#index"
  post "/reports" => "reports#create"
  get "/reports/:id" => "reports#show"
  patch "/reports/:id" => "reports#update"
  delete "/reports/:id" => "reports#destroy"  

  get "/goals" => "goals#index"
  post "/goals" => "goals#create"
  get "/goals/:id" => "goals#show"
  patch "/goals/:id" => "goals#update"
  delete "/goals/:id" => "goals#destroy"

  get "/activities" => "activities#index"
  post "/activities" => "activities#create"
  get "/activities/:id" => "activities#show"
  patch "/activities/:id" => "activities#update"
  delete "/activities/:id" => "activities#destroy"

  get "/schools" => "schools#index"
  post "/schools" => "schools#create"
  get "/schools/:id" => "schools#show"
  patch "/schools/:id" => "schools#update"
  delete "/schools/:id" => "schools#destroy"

  
end
