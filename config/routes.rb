Muenster::Application.routes.draw do
  resources :jobs, only: [:index]
end
