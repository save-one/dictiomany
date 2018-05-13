class WordsController < ApplicationController
  def show
    @diction = Diction.find(params[:diction_id])
    @word = Word.find(params[:id])
    @meanings = Meaning.where(word_id: @word.id)
  end

  def create
  	diction = Diction.find(params[:diction_id])
  	word = diction.words.new(word_params)
    word.category_parent = params[:category_parent]
    word.category = params[:category]
  	word.save
    redirect_to diction_path(diction.id)
  end

  def update
    diction = Diction.find(params[:diction_id])
    word = Word.find(params[:id])
    word.category_parent = params[:category_parent]
    word.category = params[:category]
    word.update(word_params)
    redirect_to diction_word_path(diction_id:diction.id, id:word.id)
  end

  def destroy
  end

  private

  def word_params
  	params.require(:word).permit(:name, :kana, :category_parent, :category)
  end
end
