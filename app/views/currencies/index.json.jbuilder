json.array!(@currencies) do |currency|
  json.extract! currency, :id, :name, :finance_sources_id
  json.url currency_url(currency, format: :json)
end
