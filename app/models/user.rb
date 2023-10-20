class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday].each do |v|
    validates v, presence: true
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  validates_format_of :last_name, :first_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Input full-width characters'
  validates_format_of :last_name_kana, :first_name_kana, with: /\A[ァ-ヶー－]+\z/, message: 'Input full-width katakana characters'

  validates :nickname, length: { maximum: 40 }
  validates :password, length: { minimum: 6 }

  has_many :items
end
