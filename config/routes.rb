Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root 'welcome#index'
  resource :welcome, only: [:index, :update], as: 'welcome'
  resource :availability, only: :update
end
