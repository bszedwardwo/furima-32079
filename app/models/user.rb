class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable


  validates :nickname, presence: true
  validates :birth_date, presence: true
  with_options presence: true, format: { with: /\A[あ-んア-ン一-龥]+\z/, message: '漢字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  
  with_options presence: true, format: { with: /\A[ア-ン]+\z/, message: '全角カナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: '英字と数字の両方を含めて設定してください' }

end