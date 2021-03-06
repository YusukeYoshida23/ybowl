Rails.application.routes.draw do
  resources :bowling_centers do
    resources :scores
  end
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users, only: [:show]
  root to:  'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
