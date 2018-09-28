class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :trackable, :validatable

  attachment :profile_image, destroy: false
  has_many :books
  validates :introduction, length: {maximum: 50}
  validates :name, length: {in: 2..50}
end
