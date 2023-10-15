class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday].each do |v|
          validates v, presence: true
  end
  # validates 記述する お名前→全角 お名前(カナ)→カタカナ、全角 
  validates_format_of :last_name, :first_name, with:/\A[ぁ-んァ-ン一-龥々]+\z/, message: "Input full-width characters"
  validates_format_of :last_name_kana, :first_name_kana, with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters"

  validates :nickname, length: { maximum: 40 }
  validates :password, length: { minimum: 6 }
 
end
