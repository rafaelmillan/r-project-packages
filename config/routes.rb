Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/packages')

  resources :packages, only: [:index] do
    resources :versions, only: [:show]
  end
end
