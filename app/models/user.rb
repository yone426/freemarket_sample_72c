class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :products 
  has_many :comments
  has_many :likes
  has_one :addresse
  has_one :card

  validates :name,:email,:nickname,:fullname,:fullname_katakana,:phone_number,:birthday, presence: true



end
