class PublicsController < ApplicationController
	#単語一覧
  def index
  	@public_words = Public.all
  end

  #一単語に対する意味の一覧
  def show
  end

 #一意味に対するコメントの一覧
  def mean
  end

  def create
  	public_diction = Diction.find_by(user_id: current_user.id, default_public_flg: true)
  	word = public_diction.words.create(public_word_params)#meaningのcontentも作成されて入る
  	word.category_parent = params[:category_parent]
    word.category = params[:category]
  	word.save

  	#いったんセーブしてアップデートの形をとる wordとmeaningが使えないのと、meaningの他のカラムも入れるため
  	meaning = Meaning.find_by(word_id: word.id)
  	meaning.word_name = word.name
  	meaning.word_kana = word.kana
    meaning.word_category_parent = word.category_parent
  	meaning.word_category = word.category
  	meaning.update(word_id: word.id)

  	new_public = Public.new
  	new_public.name = word.name
  	new_public.kana = word.kana
    new_public.category_parent = word.category_parent
  	new_public.category = word.category
  	new_public.save
  	redirect_to public_path(new_public)
  end

  private

  def public_word_params
  	params.require(:word).permit(:name,
  		:kana,
  		:category,
  		:category_parent,
  		meanings_attributes: [:content]
  		)
  end

  # def public_meaning_params
  # 	params.require(:meaning).permit(:content)
  # end
end
