json.array!(@skills) do |skill|
  json.extract! skill, :id, :name, :contacts_id
  json.url skill_url(skill, format: :json)
end
