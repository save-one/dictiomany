class Hit < ApplicationRecord
  belongs_to :public, optional: true
  belongs_to :meaning, optional: true
end
