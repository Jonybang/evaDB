json.array!(@subunits) do |subunit|
  json.extract! subunit, :id, :name, :organization_id, :rooms_id, :equips_id
  json.url subunit_url(subunit, format: :json)
end
