Rails.application.routes.draw do
  root to: "companies#index"

  resources :companies do
    resources :jobs, only: [:new, :create]
  end

  resources :jobs, only: [:index, :show, :edit, :update, :destroy] do
    resources :comments
  end

  resources :categories

end
