class Public < ApplicationRecord
	has_many :hits

	validates :name, presence: true
	validates :category, presence: true
	validates :category_parent, presence: true
	validates :kana, presence: true

end
