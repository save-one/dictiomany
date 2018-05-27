class Admins::AdminsController < Admins::ApplicationController
before_action :authenticate_admin!
	#マイページ
	def show
		@user = User.find(params[:id])
		@side_user = User.find(params[:id])
		#アカウントの辞書
		@my_dictions = Diction.where(user_id: @user.id)

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
		admin = Admin.find(params[:id])
		admin.update(admin_params)
		redirect_to admins_admin_path(admin)
	end

private

	def admin_params
		params.require(:admin).permit(:name, :admin_word, :gender, :birthday, :image)
	end
end
