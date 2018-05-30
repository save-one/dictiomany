class FavoriteDiction < ApplicationRecord
  belongs_to :diction
  belongs_to :user

  validates :diction_id, presence: true
  validates :user_id, presence: true

end
