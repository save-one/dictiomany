class Hit < ApplicationRecord
  belongs_to :public, optional: true
  belongs_to :meaning, optional: true
  belongs_to :user, optional: true

  validates :user_id, presence: true

end
