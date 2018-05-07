Rails.application.routes.draw do

  devise_for :users
  root 'dictions#index'

  resources :dictions do

  	resources :words, only: [:show, :create, :update, :destroy] do

  		resources :meanings, only: [:show, :create, :update, :destroy]
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
