class Blog < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 64 }
  validates :body, presence: true, length: { maximum: 10_000 }
  validates :user_id, presence: true

  def author?(user)
    self.user == user
  end
end
