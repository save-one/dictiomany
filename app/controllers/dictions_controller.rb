class DictionsController < ApplicationController
  def index
    @dictions = Diction.all
  end

  def show
    @diction = Diction.find(params[:id])
    @words = Word.where(diction_id: @diction.id)
    #gon.diction_id = @diction.id
    #編集用
    #@edit_diction = Diction.find(params[:id])
  end

  def new
  	@diction = Diction.new
  	@word = Word.new
  	@meaning = Meaning.new
  end

  def create
  	diction = current_user.dictions.new(diction_params)
    diction.category_parent = params[:category_parent]
    diction.category = params[:category]

    #public化
    diction.public_flg = true if params[:public] === "on"

  	diction.save
  	redirect_to diction_path(diction)
  end

  def update
    diction = Diction.find(params[:id])
    diction.category_parent = params[:category_parent]
    diction.category = params[:category]

    #public化
    if params[:public] === "on"
      diction.public_flg = true
    else
      diction.public_flg = false
    end

    diction.update(diction_params)
    redirect_to diction_path(diction)
  end

  def destroy
  end

  private

  def diction_params
  	params.require(:diction).permit(:name, :category)
  end
end
