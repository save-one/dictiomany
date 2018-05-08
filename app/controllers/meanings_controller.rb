class MeaningsController < ApplicationController
  def show
    @diction = Diction.find(params[:diction_id])
    @word = Word.find(params[:word_id])
    @meaning = Meaning.find(params[:id])
    @comments = Comment.where(meaning_id: @meaning.id)
  end

  def create
    diction = Diction.find(params[:diction_id])
  	word = Word.find(params[:word_id])
  	meaning = word.meanings.new(meaning_params)
  	meaning.word_name = word.name
    meaning.word_category_parent = word.category_parent
  	meaning.word_category = word.category
  	meaning.save
    redirect_to diction_word_path(diction_id: diction.id, id: word.id)
  end

  def update
  end

  def destroy
  end

  private

  def meaning_params
  	params.require(:meaning).permit(:content)
  end
end
