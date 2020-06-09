module Forms
  class Session
    include ActiveModel::Model

    attr_accessor :login_id, :password, :session

    validates :login_id, presence: true
    validates :password, presence: true
    validates :session, presence: true
    validate :password_cannot_authenticate

    def save
      return false if invalid?

      session[:user_id] = user.id
    end

    def user
      @user ||= User.find_by(login_id: login_id)
    end

    def password_cannot_authenticate
      errors.add(:password, 'login_id or password is wrong') if user.blank? || user.authenticate(password)
    end
  end
end
