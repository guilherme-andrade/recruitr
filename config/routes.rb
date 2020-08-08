Rails.application.routes.draw do
  devise_for :users
  root to: 'static#home'
  get 'static/home'

  resources :applicants, only: %i[show]
  resources :job_offers, except: %i[edit update] do
    resources :applications, only: %i[create]
  end
end
