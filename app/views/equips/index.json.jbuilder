json.array!(@equips) do |equip|
  json.extract! equip, :id, :name, :model, :description, :parametres, :responsible_id, :organization_id, :subunit_id, :room_id
  json.url equip_url(equip, format: :json)
end
