class FavoriteMeaning < ApplicationRecord
  belongs_to :meaning
  belongs_to :user
end
