
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  #validates :password, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "は文字以上の半角英数字で入力してください" }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は英字と数字を含む６文字以上の半角英数字で入力してください" }
  validates :first_name,:name, format:{with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message:"全角で入力してください" }
  validates :first_name_kana,:name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください" }
  validates :nick_name,:first_name,:name,:first_name_kana,:name_kana,:birth_date, presence: true

  has_many :items
  has_many :orders


  
end


