# frozen_string_literal: true

Rails.application.routes.draw do
  resources :order_items
  resources :products
  resources :orders
  resources :categories
  resources :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :orders, only: %i[index]
    end
  end

  get "healthz" => "health#show", as: :rails_health_check
  # Defines the root path route ("/")
end
