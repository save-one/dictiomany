class Word < ApplicationRecord
  belongs_to :diction
  has_many :meanings
end
