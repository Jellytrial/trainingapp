# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'courses/index'

  resources :courses do
    member do
      patch 'course_restore'
    end
  end

  root 'toppage#index'
  get 'create'    => 'courses#new'
  get 'all'       => 'courses#index'
  get 'search'    => 'toppage#search'
  get 'cate_search' => 'toppage#cate_search'
  get 'course' => 'courses#show'
  get 'deleted' => 'courses#discarded'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
