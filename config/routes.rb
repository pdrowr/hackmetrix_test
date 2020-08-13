# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/overrides/registration'
      }

      scope :admin do
        resources :tasks, only: %w[index create update], module: 'v1/admin'
      end

      scope :client do
        resources :tasks, only: %w[index show], module: 'v1/client'
      end
    end
  end
end
