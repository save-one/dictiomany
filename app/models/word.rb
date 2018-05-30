class Word < ApplicationRecord
  belongs_to :diction
  has_many :meanings, dependent: :destroy
  has_many :reports

  accepts_nested_attributes_for :meanings

  validates :name, presence: true
  validates :kana, presence: true
  validates :category, presence: true
  validates :category_parent, presence: true
  validates :diction_id, presence: true

end
