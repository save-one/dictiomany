class Comment < ApplicationRecord
  belongs_to :meaning
  belongs_to :user
  has_many :reports
end
