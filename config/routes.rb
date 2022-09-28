# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :contacts, path: '/' do
    resources :contacts
  end

  devise_for :users,
             path: '/',
             class_name: 'User',
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             },
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'register'
             }
  root to: 'health#index'
end
