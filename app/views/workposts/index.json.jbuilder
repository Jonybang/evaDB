json.array!(@workposts) do |workpost|
  json.extract! workpost, :id, :name, :contacts_id
  json.url workpost_url(workpost, format: :json)
end
