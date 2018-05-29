class DictionsController < ApplicationController
  def index
    # category = params[:refine_category]
    # q_before = {"category_parent_or_category_eq" => category}
    # before = Diction.search(q_before)
    # refined = before.result
    @search = Diction.search(params[:q])#refined.search(params[:q])
    @dictions = @search.result
    @dictions = @dictions.where(category_parent: params[:refine_category]).or(@dictions.where(category: params[:refine_category])) if params[:refine_category].present?
    @dictions = @dictions.where.not(default_public_flg: true)
    @dictions = @dictions.page(params[:page])
    @c_selected = params[:refine_category]
    q = params[:q]
    @search_content = q["name_or_category_parent_or_category_cont"] if params[:q].present?
  end

  def show
    @diction = Diction.find(params[:id])
    redirect_back(fallback_location: root_path) unless @diction.public_flg === true || @diction.user_id === current_user.id || GroupUser.find_by(diction_id: @diction.id, user_id: current_user.id)
    gon.groupuser_user_id = GroupUser.where(diction_id: @diction.id).pluck(:user_id)
    @search = Word.search(params[:q])
    @words = @search.result
    @words = @words.where(diction_id: @diction.id)
    @words = @words.where(category_parent: params[:refine_category]).or(@words.where(category: params[:refine_category])) if params[:refine_category].present?
    @words = @words.page(params[:page])
    @c_selected = params[:refine_category]
    q = params[:q]
    @search_content = q["name_or_kana_or_category_parent_or_category_cont"] if params[:q].present?
    #gon.diction_id = @diction.id
    #編集用
    #@edit_diction = Diction.find(params[:id])
  end

  # def new
  # 	@diction = Diction.new
  # 	@word = Word.new
  # 	@meaning = Meaning.new
  # end

  def create
  	diction = current_user.dictions.new(diction_params)
    diction.category_parent = params[:category_parent]
    diction.category = params[:category]

    #public化
    diction.public_flg = true if params[:public] === "on"

    # 共有化
    if select_users = params[:select_user]
      group = Group.create(name: "")
      select_users.each do |s|
        g_user = User.find(s)
        groupuser = diction.group_users.build(group_id: group.id, user_id: g_user.id)
        groupuser.save
      end
      groupuser = diction.group_users.build(group_id: group.id, user_id: current_user.id)
      groupuser.save
      diction.group_id = group.id
    end

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

    if select_users = params[:select_user]
      unless group = Group.joins(:group_users).where(group_users: {diction_id: diction.id}).last
        group = Group.create(name: "")
      end
      select_users.each do |s|
        g_user = User.find(s)
        unless GroupUser.find_by(diction_id: diction.id, user_id: g_user.id)
          groupuser = diction.group_users.build(group_id: group.id, user_id: g_user.id)
          groupuser.save
        end
      end

      new_groupusers = GroupUser.where(diction_id: diction.id, group_id: group.id).pluck(:user_id)
      new_groupusers.each do |n|
        unless select_users.include?(n.to_s)
          groupuser = GroupUser.find_by(user_id: n, diction_id: diction.id, group_id: group.id)
          groupuser.destroy#(user_id: n, diction_id: diction.id, group_id: group.id)
        end
      end
      unless GroupUser.find_by(diction_id: diction.id, user_id: current_user.id)
        groupuser = diction.group_users.build(group_id: group.id, user_id: current_user.id)
        groupuser.save
      end
      diction.group_id = group.id unless diction.group_id === group.id
    end

    diction.update(diction_params)
    redirect_to diction_path(diction)
  end

  def destroy
    diction = Diction.find(params[:id])
    diction.destroy
    redirect_to dictions_path
  end

  def user_select#あるだけ 共有用アカウント検索用
  end

  private

  def diction_params
  	params.require(:diction).permit(:name, :category, :category_parent)
  end
end
