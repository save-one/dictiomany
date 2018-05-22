class Admins::CommentsController < Admins::ApplicationController
	# def create
	# 	diction = Diction.find(params[:diction_id])
	# 	word = Word.find(params[:word_id])
	# 	meaning = Meaning.find(params[:meaning_id])
	# 	comment = meaning.comments.new(comment_params)
	# 	comment.user_id = current_user.id
	# 	comment.save
	# 	if params[:pub]
	# 		publicn = Public.find_by(name: word.name, kana: word.kana, category_parent: word.category_parent, category: word.category)
	# 		redirect_to mean_path(public_id: publicn.id, id: meaning.id)
	# 	else
	# 		redirect_to diction_word_meaning_path(diction_id: diction.id, word_id: word.id, id: meaning.id)
	# 	end
	# end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end
end
