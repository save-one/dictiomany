class HitsController < ApplicationController
  def index
  	user = User.find(params[:user_id])
  	myhits = Hit.where(user_id: user.id)
  	myhits = myhits.where("meaning_id not ?", nil)
  	meanings = []
  	myhits.each do |m|
  		if m.meaning.word.diction.public_flg === true
  			meanings.push(m)
  		end
  	end
  	meanings = meanings.sort.reverse
  	@myhits = Kaminari.paginate_array(meanings).page(params[:page])

  	# user = User.find(params[:user_id])
  	# myhits = Hit.where(user_id: user.id)
  	# myhits = myhits.where("meaning_id not ?", nil)

  	# meanings = []
  	# myhits.each do |m|
  	# 	if m.meaning.word.diction.public_flg === true
  	# 		meanings.push(m)
  	# 	end
  	# end
  	# meanings = meanings.sort.reverse
  	# meanings = meanings.group(:meaning_id)
  	# first_v = []
  	# myhits.each do |k, v|
  	# 	first_v.push(v.first)
  	# end
  	# first_hits = []
  	# first_v.each do |f|
  	# 	hit = Hit.find(f)
  	# 	first_hits.push(hit)
  	# end
  	# @myhits = Kaminari.paginate_array(first_hits).page(params[:page])
  end
end
