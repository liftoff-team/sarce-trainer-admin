Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resource :my_profile, only: :show
  resources :questions

  namespace :admin do
    resources :users, only: %i(show index)
    resources :documentations
    resources :daily_questions
  end
end
