class UsersController < ApplicationController
	def index
		@q = User.search(params[:q])
		@users = @q.result
	end

	#マイページ
	def show
		@user = User.find(params[:id])
		@my_dictions = Diction.where(user_id: @user.id)
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user)
	end

private

	def user_params
		params.require(:user).permit(:name, :user_word, :gender, :birthday, :image)
	end
end
