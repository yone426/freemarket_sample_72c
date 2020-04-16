class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
         
  has_many :products 
  has_many :comments
  has_one :address
  has_one :card
  has_many :likes
  has_many :like_products, through: :likes, source: :product
  has_many :sns_credentials

  KATAKANA = /\A[ァ-ヶー－]+\z/
  FULLNAME =/\A[ぁ-んァ-ン一-龥]/
  validates :email,:nickname,:fullname,:fullname_katakana,:phone_number,:birthday, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true,format: { with: VALID_EMAIL_REGEX }

  validates :fullname, format: { with: FULLNAME }
  validates :fullname_katakana, format: { with: KATAKANA }
  validates :phone_number,numericality: :only_integer

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
  
end
