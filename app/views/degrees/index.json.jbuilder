json.array!(@degrees) do |degree|
  json.extract! degree, :id, :name, :scientists_id
  json.url degree_url(degree, format: :json)
end
