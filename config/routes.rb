Rails.application.routes.draw do
  root 'projects#index'
  get '/projects/:id', to: 'tasks#show'
  resources :tasks do
    member do
      patch :completed
    end
  end

  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
