class WordsController < ApplicationController
  def show
    @diction = Diction.find(params[:diction_id])
    @word = Word.find(params[:word_id])
    @meanings = Meaning.where(word_id: @word.id)
  end

  def create
  	diction = Diction.find(1)
  	word = diction.words.new(word_params)
  	word.save
  end

  def update
  end

  def destroy
  end

  private

  def word_params
  	params.require(:word).permit(:name, :kana, :category)
  end
end
