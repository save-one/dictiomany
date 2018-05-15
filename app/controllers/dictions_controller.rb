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

      words = Word.where(diction_id: diction.id)
      words.each do |w|
        if publicn = Public.find_by(name: w.name, kana: w.kana, category_parent: w.category_parent, category: w.category)

        else
          new_public = Public.new
          new_public.name = w.name
          new_public.kana = w.kana
          new_public.category_parent = w.category_parent
          new_public.category = w.category
          new_public.save
        end
      end
    else
      diction.public_flg = false

    end

    diction.update(diction_params)
    redirect_to diction_path(diction)
  end

  def destroy
    diction = Diction.find(params[:id])
    diction.destroy
    redirect_to dictions_path
  end

  private

  def diction_params
  	params.require(:diction).permit(:name, :category)
  end
end
