json.array!(@universities) do |university|
  json.extract! university, :id, :name, :contact_data_id, :link_id, :faculties_id, :contacts_id
  json.url university_url(university, format: :json)
end
