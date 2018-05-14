class FavoriteDiction < ApplicationRecord
  belongs_to :diction
  belongs_to :user
end
