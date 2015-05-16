json.array!(@specialties) do |specialty|
  json.extract! specialty, :id, :name, :contact_data_id, :link_id, :faculty_id, :contacts_id
  json.url specialty_url(specialty, format: :json)
end
