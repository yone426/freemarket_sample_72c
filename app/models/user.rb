class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :products 
  has_many :comments
  has_one :address
  has_one :card
  has_many :likes
  has_many :like_productss, through: :likes, source: :product

  KATAKANA = /\A[ァ-ヶー－]+\z/
  FULLNAME =/\A[ぁ-んァ-ン一-龥]/
  validates :email,:nickname,:fullname,:fullname_katakana,:phone_number,:birthday, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true,format: { with: VALID_EMAIL_REGEX }
  validates :password,:password_confirmation, length:{minimum:6}
  validates :fullname, format: {with:FULLNAME}
  validates :fullname_katakana, format: {with:KATAKANA}
  validates :phone_number,numericality: :only_integer

end
