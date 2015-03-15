json.array!(@resources) do |resource|
  json.extract! resource, :id, :name, :default_value
  json.url resource_url(resource, format: :json)
end
