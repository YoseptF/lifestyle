Rails.application.routes.draw do

  resources :categories, only: %i[index show]
  resources :articles, only: %i[show new create] do
    resources :votes, only: %i[create destroy]
  end

  resources :sessions, only: %i[new create destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'categories#index'
end
