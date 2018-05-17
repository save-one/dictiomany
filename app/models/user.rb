class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :image
  has_many :dictions
  has_many :group_users
  has_many :comments
  has_many :favorite_dictions
  has_many :favorite_meanings
  has_many :contacts
  has_many :reports
end
