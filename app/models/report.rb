class Report < ApplicationRecord
  belongs_to :user
  belongs_to :diction, optional: true
  belongs_to :word, optional: true
  belongs_to :meaning, optional: true
  belongs_to :comment, optional: true

  validates :reason, presence: true
  validates :user_id, presence: true

end
