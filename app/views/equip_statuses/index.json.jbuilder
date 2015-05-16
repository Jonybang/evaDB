json.array!(@equip_statuses) do |equip_status|
  json.extract! equip_status, :id, :name, :equips_id
  json.url equip_status_url(equip_status, format: :json)
end
