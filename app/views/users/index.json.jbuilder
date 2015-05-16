<<<<<<< HEAD
json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :password_hash, :password_salt
  json.url user_url(user, format: :json)
end
=======
json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :password_hash, :password_salt
  json.url user_url(user, format: :json)
end
>>>>>>> 5ab5a8da4ba00a34ea1da0744f2d7980a5694bda
