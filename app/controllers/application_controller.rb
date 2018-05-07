class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :newdiction
private

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :gender, :birthday])
  end

  def newdiction
  	@new_diction = Diction.new
  	#金融
  	@categories1 = ["金融","銀行","証券","商品先物","損害保険","消費者金融","クレジットカード","リース"]
  	#建設・不動産
  	@categories2 = ["建設","不動産","住宅","住宅設備","電気通信工事","土木","建設コンサル","ビル管理","高速道路","駐車場"]
  	#物流・運送
  	@categories3 = ["運送","航空","鉄道","海運","倉庫・運輸"]
  end
end
