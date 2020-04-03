class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :products 
  has_many :comments
  has_many :likes
  has_one :address
  has_one :card

  KATAKANA = /\A[ァ-ヶー－]+\z/
  FULLNAME =/\A[一-龥ぁ-ん]/


  validates :email,:nickname,:fullname,:fullname_katakana,:phone_number,:birthday, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true,format: { with: VALID_EMAIL_REGEX }
  validates :password,:password_confirmation, length:{maximum:7}
  validates :fullname, format: {with:FULLNAME}
  validates :fullname_katakana, format: {with:KATAKANA}
  validates :phone_number,numericality: :only_integer
end
