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
	end

	def destroy_meanfovo
	end
end
