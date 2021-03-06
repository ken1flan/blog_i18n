class User < ApplicationRecord
  has_many :blogs, dependent: :destroy

  has_secure_password

  validates :login_id, presence: true, length: { minimum: 5, maximum: 32 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 8, maximum: 64 }
  validates :name, presence: true, length: { minimum: 5, maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, email_format: true
  validates :phone, presence: true, uniqueness: true, phone_format: true
  validates :introduction, length: { maximum: 10_000 }
end
