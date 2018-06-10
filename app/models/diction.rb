class Diction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :group, optional: true
  has_many :words, dependent: :destroy
  has_many :favorite_dictions, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :reports, dependent: :destroy

  validates :name, presence: true
  validates :user_id, presence: true

end
