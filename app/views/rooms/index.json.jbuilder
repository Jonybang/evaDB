json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :subunit_id, :equips_id
  json.url room_url(room, format: :json)
end
