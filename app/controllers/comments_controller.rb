class CommentsController < ApplicationController
	def create
		diction = Diction.find(params[:diction_id])
		word = Word.find(params[:word_id])
		meaning = Meaning.find(params[:meaning_id])
		comment = meaning.comments.new(comment_params)
		comment.user_id = current_user.id
		comment.save
		redirect_to diction_word_meaning_path(diction_id: diction.id, word_id: word.id, id: meaning.id)
	end

	def destroy
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end
end
