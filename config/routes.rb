Rails.application.routes.draw do
  devise_for :users, controllers: {
  	registrations: 'users/registrations',
  	sessions: 'users/sessions',
  	confirmtions: 'users/confirmtions',
  	passwords: 'users/passwords',
  	unlocks: 'users/unlocks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
