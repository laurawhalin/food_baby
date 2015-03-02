Rails.application.routes.draw do

  root 'welcome#index'
  resources :restaurants, only: [:index, :show]

end
