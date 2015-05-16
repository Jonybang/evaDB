json.array!(@intellect_types) do |intellect_type|
  json.extract! intellect_type, :id, :name, :intellect_properties_id
  json.url intellect_type_url(intellect_type, format: :json)
end
