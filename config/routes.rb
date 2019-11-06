Rails.application.routes.draw do
  resources :journals
  resources :places
  get 'main/home'
  root 'main#home' 

  get 'signup', to: 'users#new'
  resources :users, except:[:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
