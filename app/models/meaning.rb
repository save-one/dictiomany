class Meaning < ApplicationRecord
  belongs_to :word
  has_many :comments, dependent: :destroy
  has_many :favorite_meanings, dependent: :destroy
  has_many :reports
  has_many :hits


end
