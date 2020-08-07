Rails.application.routes.draw do
  devise_for :users
  root to: 'static#home'
  get 'static/home'

  resources :applicants
  resources :job_offers do
    resources :applications
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
