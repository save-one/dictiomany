class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_new
  before_action :create_public_diction
private

  #ログイン後の遷移先
  def after_sign_in_path_for(resource_or_scope)
    # if resource_or_scope == :admin
    #   admins_root_path
    # elsif resource_or_scope == :user
    #   root_path
    # end

    if resource_or_scope.is_a?(Admin)
      admins_root_path
    else
      root_path
    end

  end

  #ログアウト後の遷移先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :user
      new_user_session_path
    end
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :gender, :birthday])
  end

  #マイパブリック辞書の作成 デフォルトで必要なパブリックに投稿した単語の保存用
  def create_public_diction
    if user_signed_in?
      if @public_diction = Diction.find_by(user_id: current_user.id, default_public_flg: true)
        else
          @public_diction = current_user.dictions.build
          @public_diction.name = "マイパブリック辞書"
          @public_diction.public_flg = true
          @public_diction.default_public_flg = true
          @public_diction.save
      end
    end
  end

  def user_new
    # 共有用、アカウント検索
    if user_signed_in?
      user_select_all = User.where.not(id: current_user.id)
      @search_user_select = user_select_all.search(params[:q])
      @search_users = user_select_all# 出ていることが大事だからresultはなし 検索についてはuser_selectアクションで行う
    end


    #header検索用パブリック
    @search_header = Public.search(params[:q])
    @public_words = @search_header.result
    #footerカテゴリ用パブリック
    @search_footer = Public.search(params[:q])
    @public_words = @search_header.result
    #footer用索引
    @search_index1 = ["あ", "い", "う", "え", "お"], ["か", "き", "く", "け", "こ"], ["さ", "し", "す", "せ", "そ"], ["た", "ち", "つ", "て", "と"], ["な", "に", "ぬ", "ね", "の"], ["は", "ひ", "ふ", "へ", "ほ"], ["ま", "み", "む", "め", "も"], ["や", "ゆ", "よ"], ["ら", "り", "る", "れ", "ろ"], ["わ", "を", "ん",]
    @search_index2 = ["が","ぎ","ぐ","げ","ご"],["ざ","じ","ず","ぜ","ぞ"],["だ","ぢ","づ","で","ど"],["ば","び","ぶ","べ","ぼ"],["ぱ","ぴ","ぷ","ぺ","ぽ"]
    @search_index3 = ["Ａ","Ｂ","Ｃ","Ｄ","Ｅ"],["Ｆ","Ｇ","Ｈ","Ｉ","Ｊ"],["Ｋ","Ｌ","Ｍ","Ｎ","Ｏ"],["Ｐ","Ｑ","Ｒ","Ｓ","Ｔ"],["Ｕ","Ｖ","Ｗ","Ｘ","Ｙ"],["Ｚ"]
    @search_index4 = ["1","2","3","4","5"],["6","7","8","9","0"]
    #current_user
    if user_signed_in?
      @side_user = current_user #userのshowアクションでのみ、アクション内でparamsにあったものに切り替える
    end
  	#dictionally
  	@new_diction = Diction.new
  	#word
  	@new_word = Word.new
  	#meaning
  	@new_meaning = Meaning.new
  	#comment
  	@new_comment = Comment.new
    #public
    @new_public_word = Word.new
    @new_public_word.meanings.build

    #ランキング用
    #閲覧数
    hit_ranks = Hit.where.not(public_id: nil)
    hit_ranks = hit_ranks.group(:public_id).count#各単語の閲覧数を集計してpublic_idとセットでハッシュとする
    hit_ranks = hit_ranks.sort_by{|_, v| -v}#閲覧数で並び替え
    @hit_ranks = hit_ranks.take(5)

    #お気に入り登録数
    favo_all = FavoriteMeaning.joins({:meaning => {:word => :diction}}).where(dictions: {public_flg: true}).pluck(:meaning_id)#各意味の辞書の公開設定を確認し、meaning_idのみ引き出す
    fmeaning = Meaning.find(favo_all).pluck(:word_id)#意味を探し、そのword_idを取得
    fword = Word.find(fmeaning).uniq#重複をなくす
    count = []#各集計をまとめる用
    fword.each do |fw|
      fm = Meaning.where(word_id: fw.id)
      fc = 0#集計用
      #お気に入りの数を調べてfcに入れる
      fm.each do |ffm|
        fcc = FavoriteMeaning.where(meaning_id: ffm).count
        fc += fcc
      end
      count.push(fc)#配列として集計結果をためる
    end
    ary = [fword, count].transpose#単語とそのお気に入り数の集計の二つの配列の中身を結びつける
    favo_ranks = Hash[*ary.flatten]#閲覧数と同じようなハッシュに変換
    favo_ranks = favo_ranks.sort_by{|_, v| -v}
    @favo_ranks = favo_ranks.take(5)
    # favo_ranks = []
    # favo_all.each do |f|
    #   if f.meaning.word.diction.public_flg === true
    #     favo_ranks.push(f)
    #   end
    # end
    # favo_ranks = favo_ranks.group(:meaning_id).count
    # favo_ranks = favo_ranks.sort_by{|_, v| -v}
    # @favo_ranks = favo_ranks.take(5)

    #グループ辞書作成、共有用 検索
    # @q = User.search(params[:q])
    # @search_users = @q.result
    # unless params[:q].blank?
    #   render json: @search_users.select("id").map {|e| e.id }.to_json
    # end

  	#親カテゴリ
  	@parents = ["金融", "建設・不動産", "物流・運送", "IT・メディア", "エネルギー・資源", "自動車・機械", "電機・精密", "食品", "小売・卸", "生活関連", "衣料・装飾", "サービス", "飲食", "娯楽・レジャー"]
  	#金融
  	@categories1 = ["金融","銀行","証券","商品先物","損害保険","消費者金融","クレジットカード","リース"]
  	#建設・不動産
  	@categories2 = ["建設","不動産","住宅","住宅設備","電気通信工事","土木","建設コンサル","ビル管理","高速道路","駐車場"]
  	#物流・運送
  	@categories3 = ["運送","航空","鉄道","海運","倉庫・運輸"]
  	#IT・メディア
  	@categories4 = ["通信","IT","ソフトウェア","インターネット","モバイル","携帯電話","携帯電話販売","ネット広告","テレビ","広告","出版","印刷"]
  	#エネルギー・資源
  	@categories5 = ["石油","電力","ガス","化学","繊維","鉄鋼","非鉄金属","金属製品","ガラス","土石製品","製紙","ゴム・タイヤ"]
  	#自動車・機械
  	@categories6 = ["自動車","自動車部品","二輪車・バイク","中古車","機械","造船重機","プラント","建設機械","工作機械","パチンコ（製造）"]
  	#電機・精密
  	@categories7 = ["家電","電気機器","重電","電子部品","精密機器","医療機器","時計","OA機器","半導体"]
  	#食品
  	@categories8 = ["食品","パン","製粉","菓子","ビール","清涼飲料","水産・農林","飼料"]
  	#小売・卸
  	@categories9 = ["小売","卸売","総合商社","専門商社","百貨店","スーパー","コンビニ","ドラッグストア","家電量販店","ホームセンター","スポーツ用品店","リサイクル","カー用品店"]
  	#生活関連
  	@categories10 = ["トイレタリー","製薬","インテリア","通販","文具","雑貨","スポーツ用品"]
  	#衣料・装飾
  	@categories11 = ["化粧品","アパレル","靴","メガネ","ジュエリー"]
  	#サービス
  	@categories12 = ["サービス","人材派遣","教育","介護","警備","冠婚葬祭","ブライダル","葬儀","コンサルティング"]
  	#飲食
  	@categories13 = ["飲食","カフェ","寿司","居酒屋","中食"]
  	#娯楽・レジャー
  	@categories14 = ["旅行","ホテル","レジャー施設","スポーツクラブ","ゴルフ場","カラオケ","映画","玩具","ゲーム"]
  	gon.categories1 = @categories1
  	gon.categories2 = @categories2
  	gon.categories3 = @categories3
  	gon.categories4 = @categories4
  	gon.categories5 = @categories5
  	gon.categories6 = @categories6
  	gon.categories7 = @categories7
  	gon.categories8 = @categories8
  	gon.categories9 = @categories9
  	gon.categories10 = @categories10
  	gon.categories11 = @categories11
  	gon.categories12 = @categories12
  	gon.categories13 = @categories13
  	gon.categories14 = @categories14

    #検索時にカテゴリを表示選択させるための変数
    @category_all = []
    @category_all.push(@categories1)
    @category_all.push(@categories2)
    @category_all.push(@categories3)
    @category_all.push(@categories4)
    @category_all.push(@categories5)
    @category_all.push(@categories6)
    @category_all.push(@categories7)
    @category_all.push(@categories8)
    @category_all.push(@categories9)
    @category_all.push(@categories10)
    @category_all.push(@categories11)
    @category_all.push(@categories12)
    @category_all.push(@categories13)
    @category_all.push(@categories14)

  end
end
