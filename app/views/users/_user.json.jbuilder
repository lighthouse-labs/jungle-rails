json.extract! user, :id, :name, :email, :login, :created_at, :updated_at
json.url user_url(user, format: :json)