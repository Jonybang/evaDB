json.array!(@socnets) do |socnet|
  json.extract! socnet, :id, :name, :url, :socnet_links_id
  json.url socnet_url(socnet, format: :json)
end
