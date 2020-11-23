class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true
  with_options presence: true, format: { with: /\A[あ-んア-ン一-龥]+\z/ } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ア-ン]+\z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i

  has_many :items
end
