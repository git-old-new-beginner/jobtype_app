class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :name_reading, presence: true
  validates :nickname, presence: true
  validates :profile, presence: true

  has_many :webtypes
        
end
