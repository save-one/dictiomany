class MeaningsController < ApplicationController
  def show
  end

  def create
  	word = Word.find(params[:word_id])
  	meaning = word.meanings.new(meaning_params)
  	meaning.word_name = word.name
  	meaning.word_category = word.category
  	meaning.save
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
