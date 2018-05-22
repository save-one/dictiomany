class Admins::WordsController < Admins::ApplicationController
  def show
    @diction = Diction.find(params[:diction_id])
    # redirect_back(fallback_location: root_path) unless @diction.public_flg === true || @diction.user_id === current_user.id
    @word = Word.find(params[:id])
    #@meanings = Meaning.where(word_id: @word.id)
    @search = Meaning.search(params[:q])
    @meanings = @search.result
    @meanings = @meanings.where(word_id: @word.id)
    @meanings = @meanings.page(params[:page])
    q = params[:q]
    @search_content = q["content_cont"] if params[:q].present?
  end

  # def create
  # 	diction = Diction.find(params[:diction_id])
  # 	word = diction.words.new(word_params)
  #   word.category_parent = params[:category_parent]
  #   word.category = params[:category]
  # 	word.save

  #   #public作成
  #   if diction.public_flg === true
  #     unless publicn = Public.find_by(name: word.name, kana: word.kana, category_parent: word.category_parent, category: word.category)
  #       new_public = Public.new
  #       new_public.name = word.name
  #       new_public.kana = word.kana
  #       new_public.category_parent = word.category_parent
  #       new_public.category = word.category
  #       new_public.save
  #     end
  #   end

  #   redirect_to diction_word_path(diction_id: diction.id, id: word.id)
  # end

  def update
    diction = Diction.find(params[:diction_id])
    word = Word.find(params[:id])
    word.category_parent = params[:category_parent]
    word.category = params[:category]
    word.update(word_params)

    #meaningのカラムの書き換え
    meanings = Meaning.where(word_id: word.id)
    meanings.each do |m|
      m.word_name = word.name
      m.word_kana = word.kana
      m.word_category_parent = word.category_parent
      m.word_category = word.category
      m.update(word_id: word.id)
    end

    #publicの作成
    if diction.public_flg === true
      unless publicn = Public.find_by(name: word.name, kana: word.kana, category_parent: word.category_parent, category: word.category)
        new_public = Public.new
        new_public.name = word.name
        new_public.kana = word.kana
        new_public.category_parent = word.category_parent
        new_public.category = word.category
        new_public.save
      end
    end
    redirect_to admins_diction_word_path(diction_id:diction.id, id:word.id)
  end

  def destroy
    diction = Diction.find(params[:diction_id])
    word = Word.find(params[:id])
    word.destroy
    redirect_to admins_diction_path(diction)
  end

  private

  def word_params
  	params.require(:word).permit(:name, :kana, :category_parent, :category)
  end
end
