class UserRegistration < ApplicationRecord
  belongs_to :user, optional: true
  before_create :set_token, :set_expired_at

  EXPIRATION_PERIOD = 24.hours

  private

    def set_token
      loop do
        self.token = SecureRandom.urlsafe_base64
        break if self.class.find_by(token: token).blank?
      end
    end

    def set_expired_at
      self.expired_at ||= EXPIRATION_PERIOD.since
    end
end
