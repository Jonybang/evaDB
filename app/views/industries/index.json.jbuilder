json.array!(@industries) do |industry|
  json.extract! industry, :id, :name, :contacts_id
  json.url industry_url(industry, format: :json)
end
