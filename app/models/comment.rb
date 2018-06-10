class Comment < ApplicationRecord
  belongs_to :meaning
  belongs_to :user
  has_many :reports, dependent: :destroy

  validates :content, presence: true
  validates :user_id, presence: true
  validates :meaning_id, presence: true
end
