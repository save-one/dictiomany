class Meaning < ApplicationRecord
  belongs_to :word
  has_many :comments, dependent: :destroy
  has_many :favorite_meanings, dependent: :destroy
  has_many :reports
  has_many :hits

  validates :content, presence: true
  validates :word_id, presence: true
  validates :user_id, presence: true

end
