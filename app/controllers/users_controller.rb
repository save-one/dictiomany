class UsersController < ApplicationController
	def index
		@search = User.search(params[:q])
		@users = @search.result
		@users = @users.page(params[:page])

	end

	#マイページ
	def show
		@user = User.find(params[:id])
		@side_user = User.find(params[:id])
		#アカウントの辞書
		@my_dictions = Diction.where(user_id: @user.id)

		#グループの辞書
		groupuser = GroupUser.where(user_id: @user.id).pluck(:diction_id)
		@group_dictions = Diction.find(groupuser)

		#お気に入りの辞書
		my_favorite_dictions = FavoriteDiction.where(user_id: @user.id)
		@my_favorite_dictions = []
		my_favorite_dictions.each do |fd|
			diction = Diction.find(fd.diction_id)
			@my_favorite_dictions.push(diction)
		end

		#お気に入りの単語と意味
		my_favorite_meanings = FavoriteMeaning.where(user_id: @user.id)
		@my_favorite_meanings = []
		my_favorite_meanings.each do |fm|
			meaning = Meaning.find(fm.meaning_id)
			@my_favorite_meanings.push(meaning)
		end

		#公開中の単語と意味
		public_dictions = @my_dictions.where(public_flg: true)
		@my_public_meanings = []
		public_dictions.each do |pd|
			if word = Word.where(diction_id: pd.id)
				word.each do |pw|
					meaning = Meaning.where(word_id: pw.id)
					meaning.each do |pm|
					@my_public_meanings.push(pm)
					end
				end
			end
		end

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
