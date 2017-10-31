Rails.application.routes.draw do
  resources :urlexplorers

  root "urlexplorers#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
