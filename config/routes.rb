Rails.application.routes.draw do

  devise_for :users
  root 'tops#show'

  resource :tops, only: [:show]
  resources :users, only: [:index, :show, :update]
  resources :publics, only: [:index, :show, :create, :destroy]#destroy欲しいか
  get 'publics/:public_id/means/:id' => 'publics#mean', as: "mean"
  #destroy欲しいか
  resources :dictions do

    resources :favorites, only: [:create, :destroy]

  	resources :words, only: [:show, :create, :update, :destroy] do

  		resources :meanings, only: [:show, :create, :update, :destroy] do
  			resources :comments, only: [:create, :destroy]#updateはいらないと考える
  		end
  	end
  end

  post 'meanings/:meaning_id/favorites' => 'favorites#create_meanfavo', as: "create_favorites"
  delete 'meanings/:meaning_id/favorites/:id' => 'favorites#destroy_meanfavo', as: "destroy_favorites"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
