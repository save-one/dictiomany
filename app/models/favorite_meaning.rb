class FavoriteMeaning < ApplicationRecord
  belongs_to :meaning
  belongs_to :user

  validates :user_id, presence: true
  validates :meaning_id, presence: true

end
