crumb :root do
	if admin_signed_in?
		link "Dictiomanyトップ", admins_root_path
	else
 		link "Dictiomanyトップ", root_path
 	end
end

crumb :dictions do
	link "辞書検索", dictions_path
	parent :root #してもしなくてもrootのものが一番上に必ず？来る
end

crumb :words do |diction|
	link diction.name, diction_path(diction)
	parent :dictions
end

crumb :meanings do |diction, word|
	link word.name, diction_word_path(diction_id: diction.id, id: word.id)
	parent :words, diction
end

crumb :comments do |diction, word, meaning|
	link meaning.content.truncate(20), diction_word_meaning_path(diction_id: diction.id, word_id: word.id, id: meaning.id)
	parent :meanings, diction, word
end

crumb :publics do
	link "単語検索", publics_path
end

crumb :public do |public|
	link public.name, public_path(public)
	parent :publics
end

crumb :p_meaning do |public, meaning|
	link meaning.content.truncate(20), mean_path(public_id: public.id, id: meaning.id)
	parent :public, public
end

crumb :users do
	link "アカウント検索", users_path
end

crumb :mypage do |user|
	if user_signed_in? && user === current_user
		link "マイページ", user_path(user)
	else
		link user.name.truncate(20), user_path(user)
		parent :users
	end
end

crumb :hits do |user|
	link "閲覧履歴", user_hits_path(user_id: user.id)
	parent :mypage, user
end

crumb :contacts do |user|
	link "過去のお問い合わせ", user_contacts_path(user_id: user.id)
	parent :mypage, user
end

crumb :contact do |user, contact|
	link contact.title.truncate(20), user_contact_path(user_id: user.id, id: contact.id)
	parent :contacts, user
end

crumb :profile do
	link "サイト・作成者について", profile_path
end

# admin側
# crumb :admin_root do
#   link "Dictiomanyトップ", admins_tops_path
# end

crumb :admin_dictions do
	link "辞書検索", admins_dictions_path
	# rootは一つだけで必ず出るので、if文でroot内の分岐を行う↑
end

crumb :admin_words do |diction|
	link diction.name, admins_diction_path(diction)
	parent :admin_dictions
end

crumb :admin_meanings do |diction, word|
	link word.name, admins_diction_word_path(diction_id: diction.id, id: word.id)
	parent :admin_words, diction
end

crumb :admin_comments do |diction, word, meaning|
	link meaning.content.truncate(20), admins_diction_word_meaning_path(diction_id: diction.id, word_id: word.id, id: meaning.id)
	parent :admin_meanings, diction, word
end

crumb :admin_publics do
	link "単語検索", admins_publics_path
end

crumb :admin_public do |public|
	link public.name, admins_public_path(public)
	parent :admin_publics
end

crumb :admin_p_meaning do |public, meaning|
	link meaning.content.truncate(20), admins_mean_path(public_id: public.id, id: meaning.id)
	parent :admin_public, public
end

crumb :admin_users do
	link "アカウント検索", admins_users_path
end

crumb :admin_mypage do |user|
	if user_signed_in? && user === current_user
		link "マイページ", admins_user_path(user)
	else
		link user.name.truncate(20), admins_user_path(user)
		parent :admin_users
	end
end

crumb :admin_hits do |user|
	link "閲覧履歴", admins_user_hits_path(user_id: user.id)
	parent :admin_mypage, user
end

crumb :admin_contacts do |user|
	link "過去のお問い合わせ", admins_user_contacts_path(user_id: user.id)
	parent :admin_mypage, user
end

crumb :admin_contact do |user, contact|
	link contact.title.truncate(20), admins_user_contact_path(user_id: user.id, id: contact.id)
	parent :admin_contacts, user
end

crumb :admin_contacts_list do
	link "すべてのお問い合わせ", admins_contacts_list_path
end

crumb :admin_profile do
	link "サイト・作成者について", admins_profile_path
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).