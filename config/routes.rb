Rails.application.routes.draw do

  get 'tops/show'

  devise_for :users
  root 'tops#show'

  resource :tops, only: [:show]
  resources :users, only: [:index, :show, :update]
  resources :dictions do

  	resources :words, only: [:show, :create, :update, :destroy] do

  		resources :meanings, only: [:show, :create, :update, :destroy] do
  			resources :comments, only: [:create, :destroy]
  		end
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
