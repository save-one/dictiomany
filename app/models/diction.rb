class Diction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :group, optional: true
  has_many :words, dependent: :destroy
  has_many :favorite_dictions, dependent: :destroy
  has_many :group_users
  has_many :reports
end
