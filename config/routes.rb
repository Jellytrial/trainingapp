Rails.application.routes.draw do
  
  # get 'courses/index'

  resources :courses

  root 'toppage#index'
  get 'create'    => 'courses#new'
  get 'all'       => 'courses#index'
  get 'search'    => 'toppage#search'
  get 'cate_search'  => 'toppage#cate_search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
