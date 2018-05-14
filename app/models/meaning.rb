class Meaning < ApplicationRecord
  belongs_to :word
  has_many :comments
  has_many :favorite_meanings
end
