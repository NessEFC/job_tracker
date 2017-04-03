Rails.application.routes.draw do
  root to: "companies#index"

  resources :companies do
    resources :jobs, only: [:new, :create]
  end

  resources :jobs, only: [:index, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
  end

  resources :categories

end
