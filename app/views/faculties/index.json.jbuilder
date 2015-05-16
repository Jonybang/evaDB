json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :name, :contact_data_id, :link_id, :university_id, :specialties_id, :contacts_id
  json.url faculty_url(faculty, format: :json)
end
