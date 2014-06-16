Muenster::Application.routes.draw do
  resources :jobs, only: [:index, :show]
  resources :companies, only: [:index, :show]
end
