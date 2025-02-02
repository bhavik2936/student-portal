Rails.application.routes.draw do
  root "dashboard#show"

  devise_for :users

  unauthenticated do
    root to: "sessions#new", as: :unauthenticated_root
  end

  authenticated :user do
    root to: "dashboard#show", as: :authenticated_root
  end

  resources :students, except: [:new, :create, :destroy] do
    collection do
      post :import
    end
  end
end
