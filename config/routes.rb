Rails.application.routes.draw do

  devise_for :users
  root 'tops#show'

  resource :tops, only: [:show]

  resources :users, only: [:index, :show, :update] do
    resources :contacts, only: [:index, :show, :create]
  end

  resources :publics, only: [:index, :show, :create, :destroy]#destroy欲しいか
  get 'publics/:public_id/meanings/:id' => 'publics#mean', as: "mean"
  #destroy欲しいか
  resources :dictions do

    resources :favorites, only: [:create, :destroy]

  	resources :words, only: [:show, :create, :update, :destroy] do

  		resources :meanings, only: [:show, :create, :update, :destroy] do
  			resources :comments, only: [:create, :destroy]#updateはいらないと考える
  		end
  	end
  end

  post 'meanings/:meaning_id/favorites' => 'favorites#create_meanfavo', as: "create_meanfavo"
  delete 'meanings/:meaning_id/favorites/:id' => 'favorites#destroy_meanfavo', as: "destroy_meanfavo"

  resources :contacts, only: [:index, :show, :new]

  post 'dictions/:diction_id/reports' => 'reports#diction', as: "diction_reports"
  post 'words/:word_id/reports' => 'reports#word', as: "word_reports"
  post 'meanings/:meaning_id/reports' => 'reports#meaning', as: "meaning_reports"
  post 'comments/:comment_id/reports' => 'reports#comment', as: "comment_reports"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
