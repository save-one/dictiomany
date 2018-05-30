class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :diction

  validates :user_id, presence: true
  validates :diction_id, presence: true
end
