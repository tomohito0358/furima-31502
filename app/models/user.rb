class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options                    presence: true do
    validates :nickname
    validates :email
    validates :password,            length:{minimum:6}
    validates :first_name
    validates :last_name
    validates :first_name_read
    validates :first_name_read,     format: { with: /\A[\p{katakana}]+\z/}
    validates :last_name_read
    validates :last_name_read,      format: { with: /\A[\p{katakana}]+\z/}
    validates :birth_day
  end

end
