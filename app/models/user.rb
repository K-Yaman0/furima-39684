class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday].each do |v|
          validates v, presence: true
   end
end
