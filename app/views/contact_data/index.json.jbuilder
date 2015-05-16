json.array!(@contact_data) do |contact_data|
  json.extract! contact_data, :id, :name, :phone, :email, :addres, :link_id
  json.url contact_data_url(contact_data, format: :json)
end
