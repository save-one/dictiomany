class DictionsController < ApplicationController
  def index
    @dictions = Diction.all
  end

  def show
    @diction = Diction.find(params[:id])
    @words = Word.where(diction_id: @diction.id)
  end

  def new
  	@diction = Diction.new
  	@word = Word.new
  	@meaning = Meaning.new
  end

  def create
  	@diction = Diction.new(diction_params)
  	@diction.save
  	redirect_to dictions_path
  end

  def update
  end

  def destroy
  end

  private

  def diction_params
  	params.require(:diction).permit(:name, :category)
  end
end
