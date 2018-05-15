class Word < ApplicationRecord
  belongs_to :diction
  has_many :meanings, dependent: :destroy

  accepts_nested_attributes_for :meanings
end
