json.extract! user, :id, :username, :email, :name, :password_digest, :phone, :deactivated, :created_at, :updated_at
json.url user_url(user, format: :json)
