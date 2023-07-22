class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :items
 

  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :lastname
    validates :firstname
  end

  with_options presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/,message: "全角カタカナのみで入力して下さい"} do
    validates :lastnamekana
    validates :firstnamekana
  end
  
  with_options presence: true do
    validates :nickname, length: { maximum: 6}
    validates :nickname
    validates :birthday
  end

  #has_many :comments, dependent: :destroy
end
