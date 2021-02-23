class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options                    presence: true do
    validates :nickname
    validates :email
    validates :password,           format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
    with_options format: {with: /\A[ぁ-んァ-ン一-龥々]/} do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[\p{katakana}]+\z/} do
      validates :first_name_read
      validates :last_name_read
    end
    validates :birth_day
  end

end
