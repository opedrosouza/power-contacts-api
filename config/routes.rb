# frozen_string_literal: true

Rails.application.routes.draw do
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

  resources :contacts
  resources :contact_files, except: %i[update destroy]
end
