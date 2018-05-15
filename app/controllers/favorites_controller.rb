class FavoritesController < ApplicationController

	def create
		diction = Diction.find(params[:diction_id])
		favorite = FavoriteDiction.new
		favorite.diction_id = diction.id
		favorite.user_id = current_user.id
		favorite.save
	end

	def destroy
		favorite = FavoriteDiction.find(params[:id])
		favorite.destroy
	end

	def create_meanfavo
		meaning = Meaning.find(params[:meaning_id])
		favorite = FavoriteMeaning.new
		favorite.meaning_id = meaning.id
		favorite.user_id = current_user.id
		favorite.save
	end

	def destroy_meanfavo
		favorite = FavoriteMeaning.find(params[:id])
		favorite.destroy
	end
end
