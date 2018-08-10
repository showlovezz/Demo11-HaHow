Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
  	registrations: 'users/registrations',
  	sessions: 'users/sessions',
  	confirmtions: 'users/confirmtions',
  	passwords: 'users/passwords',
  	unlocks: 'users/unlocks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

  resources :categories, only: [:show] do
  end

  resources :projects, only: [:show] do
  end

  resources :pledges, only: [:create] do
  end

  resources :payments, only: [:show] do
    collection do
      get :mpg
      get :canceled
      post :notify
      post :paid
      post :not_paid_yet
    end
  end

end
