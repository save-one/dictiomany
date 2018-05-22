class Admins::ReportsController < Admins::ApplicationController

  def index
    @reports = Report.page(params[:page])
   
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    report = Report.find(params[:id])
    report.update
    redirect_to admins_report_path
  end

  

  # def diction
  # 	diction = Diction.find(params[:diction_id])
  # 	report = diction.reports.build(report_params)
  # 	report.user_id = current_user.id
  # 	report.save
  # 	redirect_back(fallback_location: root_path)
  # end

  # def word
  # 	word = Word.find(params[:word_id])
  # 	report = word.reports.build(report_params)
  # 	report.user_id = current_user.id
  # 	report.save
  # 	redirect_back(fallback_location: root_path)
  # end

  # def meaning
  # 	meaning = Meaning.find(params[:meaning_id])
  # 	report = meaning.reports.build(report_params)
  # 	report.user_id = current_user.id
  # 	report.save
  # 	redirect_back(fallback_location: root_path)
  # end

  # def comment
  # 	comment = Comment.find(params[:comment_id])
  # 	report = comment.reports.build(report_params)
  # 	report.user_id = current_user.id
  # 	report.save
  # 	redirect_back(fallback_location: root_path)
  # end

private

  def report_params
  	params.require(:report).permit(:reason)
  end

end
