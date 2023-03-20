Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: "tasks#get_tasks"
  post '/create', to: "tasks#create"
  put '/update/:id', to: "tasks#update"
  delete '/destroy/:id', to: "tasks#delete"
end
