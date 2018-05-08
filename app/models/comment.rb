class Comment < ApplicationRecord
  belongs_to :meaning
  belongs_to :user
end
