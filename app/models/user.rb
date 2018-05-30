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
  has_many :hits

  # for email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  validates :name, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :user_flg, presence: true

end
