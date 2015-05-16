json.array!(@intellect_properties) do |intellect_property|
  json.extract! intellect_property, :id, :name, :indnumber, :description, :formula, :regdate, :enddate, :doclink, :intellect_type_id, :authors_id, :projects_id
  json.url intellect_property_url(intellect_property, format: :json)
end
