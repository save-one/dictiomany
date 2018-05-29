class MeaningsController < ApplicationController
  def show
    @diction = Diction.find(params[:diction_id])
    redirect_back(fallback_location: root_path) unless @diction.public_flg === true || @diction.user_id === current_user.id || GroupUser.find_by(diction_id: @diction.id, user_id: current_user.id)
    @word = Word.find(params[:word_id])
    @meaning = Meaning.find(params[:id])
    @comments = Comment.where(meaning_id: @meaning.id)
    @new_c_report = Report.new
    hit = Hit.new(meaning_id: @meaning.id)
    hit.user_id = current_user.id if user_signed_in?
    hit.save
  end

  def create
    diction = Diction.find(params[:diction_id])
  	word = Word.find(params[:word_id])
  	meaning = word.meanings.new(meaning_params)
  	meaning.word_name = word.name
    meaning.word_kana = word.kana
    meaning.word_category_parent = word.category_parent
  	meaning.word_category = word.category
  	meaning.save
    redirect_to diction_word_path(diction_id: diction.id, id: word.id)
  end

  def update
    diction = Diction.find(params[:diction_id])
    word = Word.find(params[:word_id])
    meaning = Meaning.find(params[:id])
    meaning.update(meaning_params)
    redirect_to diction_word_meaning_path(diction_id: diction.id, word_id: word.id, id: meaning.id)
  end

  def destroy
    diction = Diction.find(params[:diction_id])
    word = Word.find(params[:word_id])
    meaning = Meaning.find(params[:id])
    meaning.destroy
    redirect_to diction_word_path(diction_id: diction.id, id: word.id)
  end

  private

  def meaning_params
  	params.require(:meaning).permit(:content)
  end
end
