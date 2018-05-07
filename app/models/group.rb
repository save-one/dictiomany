class Group < ApplicationRecord
	has_one :diction
	has_many :group_users
end
