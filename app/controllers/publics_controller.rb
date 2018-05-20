class PublicsController < ApplicationController
	#単語一覧
  def index
  	@public_words = Public.all
    @search = Public.search(params[:q])
    @public_words = @search.result
    @public_words = @public_words.where(category_parent: params[:refine_category]).or(@public_words.where(category: params[:refine_category])) if params[:refine_category].present?
    @public_words = @public_words.page(params[:page])
    @c_selected = params[:refine_category]
    q = params[:q]
    @search_content = q["name_or_kana_or_category_parent_or_category_cont"] if params[:q].present?
  end

  #一単語に対する意味の一覧
  def show
    @public = Public.find(params[:id])
    @search = Meaning.search(params[:q])
    p_meanings = @search.result
    p_meanings = p_meanings.where(word_name: @public.name, word_kana: @public.kana, word_category_parent: @public.category_parent, word_category: @public.category)
    @p_meanings = []
    p_meanings.each do |m|
      word = Word.find(m.word_id)
      diction = Diction.find(word.diction_id)

      #dictionのpublic_flgで公開設定を確認する
      if diction.public_flg === true
        @p_meanings.push(m)
      end
    end
    @p_meanings = Kaminari.paginate_array(@p_meanings).page(params[:page])
    q = params[:q]
    @search_content = q["content_cont"] if params[:q].present?
    hit = Hit.create(public_id: @public.id)
  end

 #一意味に対するコメントの一覧
  def mean
    @public = Public.find(params[:public_id])
    @p_meaning = Meaning.find(params[:id])
    @p_comments = Comment.where(meaning_id: @p_meaning.id)
    @word = Word.find(@p_meaning.word_id)
    @diction = Diction.find(@word.diction_id)
    hit = Hit.create(meaning_id: @p_meaning.id)
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

    if publicn = Public.find_by(name: word.name, kana: word.kana, category_parent: word.category_parent, category: word.category)
      redirect_to public_path(publicn)
    else
    	new_public = Public.new
    	new_public.name = word.name
    	new_public.kana = word.kana
      new_public.category_parent = word.category_parent
    	new_public.category = word.category
    	new_public.save
      redirect_to public_path(new_public)
    end
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
