json.array!(@socnet_links) do |socnet_link|
  json.extract! socnet_link, :id, :url, :note, :link_parent_id, :socnet
  json.url socnet_link_url(socnet_link, format: :json)
end
