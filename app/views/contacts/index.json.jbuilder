json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :contact_data_id
  json.url contact_url(contact, format: :json)
end
