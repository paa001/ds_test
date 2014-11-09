Rails.application.routes.draw do
  resources :balances, only: [:index, :show],     defaults: {format: :json}
  resources :transactions, except: [:new, :edit], defaults: {format: :json}
end
