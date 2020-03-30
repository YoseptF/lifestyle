Rails.application.routes.draw do

  resources :categories, only: %i[index show]
  resources :articles, only: %i[show]
  resources :votes, only: %i[create destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'categories#index'
end
