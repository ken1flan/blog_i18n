json.extract! user, :id, :login_id, :password_digest, :name, :email, :phone, :introduction, :created_at, :updated_at
json.url user_url(user, format: :json)
