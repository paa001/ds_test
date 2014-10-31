Rails.application.routes.draw do
  resources :balances, only: [:index, :show]
  resources :transactions, only: [:index, :show]
end
