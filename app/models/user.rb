class User < ApplicationRecord
  has_secure_password

  validates :login_id, presence: true, length: { minimum: 5, maximum: 32 }, uniqueness: true
  validates :name, presence: true, length: { minimum: 5, maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :phone, presence: true, length: { minimum: 10, maximum: 11 }, uniqueness: true
  validates :introduction, length: { maximum: 10_000 }
end
