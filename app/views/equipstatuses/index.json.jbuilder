json.array!(@equipstatuses) do |equipstatus|
  json.extract! equipstatus, :id, :name, :equips_id
  json.url equipstatus_url(equipstatus, format: :json)
end
